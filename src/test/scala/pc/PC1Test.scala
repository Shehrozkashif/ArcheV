package pc

import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

class PC1Test extends AnyFreeSpec with ChiselScalatestTester {
    "PC1" in {
        test(new PC1) {
            pc => pc.clock.step(20)
        }
    }
}
