package org.finos.morphir.runtime

import org.finos.morphir.datamodel.Util.*
import org.finos.morphir.datamodel.*
import org.finos.morphir.ir.Type
import org.finos.morphir.naming.*
import org.finos.morphir.runtime.environment.MorphirEnv
import org.finos.morphir.testing.MorphirBaseSpec
import zio.test.*
import zio.test.TestAspect.{ignore, tag}
import zio.{Console, ZIO, ZLayer}

object MorphirElmSDKsSpec extends MorphirBaseSpec {
  val testFrameworkPath =
    "morphir-elm/sdks/morphir-unit-test/morphir-ir.json"
  val morphirElmSDKTestsPaths = List(
    "morphir-elm/sdks/tests/evaluator-tests/morphir-ir.json",
    testFrameworkPath
  )

  def makeTestSummaryLayer(paths: List[String]): ZLayer[Any, Throwable, TestSummary] =
    ZLayer(for {
      dists <- ZIO.collectAll(paths.map(path => EvaluationLibrary.loadDistributionFromFileZIO(path)))
      runtime = MorphirRuntime.quick(dists: _*)
      summary <- runtime.runUnitTests()
        .provideEnvironment(MorphirEnv.live)
        .toZIOWith(RTExecutionContext.typeChecked)
    } yield summary)
  val morphirElmSDKsEvaluatorTestsSummaryLayer: ZLayer[Any, Throwable, TestSummary]    = makeTestSummaryLayer(morphirElmSDKTestsPaths)

  def getTestSummary =
    ZIO.serviceWithZIO[TestSummary] { summary => ZIO.succeed(summary) }

  def moduleCounts(packageName: String, moduleName: String) = {
    val pkgName = PackageName.fromString(packageName)
    val modName = ModuleName.fromString(moduleName)
    getTestSummary.map {
      summary => summary.countsAtModule(pkgName, modName)
    }
  }

  def spec = suite("Unit Testing Framework Tests")(
    suite("Morphir Elm SDKs Spec")(
      test("All tests passed") {
        getTestSummary.map { result =>
          assertTrue(result.passed)
        }
      }
    ).provideLayerShared(morphirElmSDKsEvaluatorTestsSummaryLayer)
  )
}
