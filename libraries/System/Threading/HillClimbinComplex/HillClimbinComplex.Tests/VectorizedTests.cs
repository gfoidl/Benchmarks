using HillClimbinComplex.Implementations;
using NUnit.Framework;

namespace HillClimbinComplex.Tests
{
    [TestFixture]
    public class VectorizedTests
    {
        [Test]
        public void Multiply_by_scalar()
        {
            ComplexVectorized c0 = new(1, 2);

            ComplexVectorized actual = c0 * 3;

            Assert.Multiple(() =>
            {
                Assert.AreEqual(3, actual.Real);
                Assert.AreEqual(6, actual.Imaginary);
            });
        }

        [Test]
        public void Divide_by_scalar()
        {
            ComplexVectorized c0 = new(9, 6);

            ComplexVectorized actual = c0 / 3;

            Assert.Multiple(() =>
            {
                Assert.AreEqual(3, actual.Real);
                Assert.AreEqual(2, actual.Imaginary);
            });
        }

        [Test]
        public void Subtraction()
        {
            ComplexVectorized c0 = new(9, 4);
            ComplexVectorized c1 = new(4, 2);

            ComplexVectorized actual = c0 - c1;

            Assert.Multiple(() =>
            {
                Assert.AreEqual(5, actual.Real);
                Assert.AreEqual(2, actual.Imaginary);
            });
        }

        [Test]
        public void Division()
        {
            ComplexVectorized c0 = new(12, 8);
            ComplexVectorized c1 = new(4, 2);

            ComplexVectorized actual = c0 / c1;

            Assert.Multiple(() =>
            {
                Assert.AreEqual(3.2, actual.Real);
                Assert.AreEqual(0.4, actual.Imaginary);
            });
        }

        [Test]
        public void Abs()
        {
            ComplexVectorized c0 = new(3, 4);

            double actual = c0.Abs();

            Assert.AreEqual(5, actual);
        }
    }
}
