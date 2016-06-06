### Cruise Control ###
# We're writing an algorithm for cruise control, where a car's driver can select
# a speed, and the car will try its best to drive at that speed.
#
# Our prototype keeps track of the desired speed and the actual speed of the car
# every second and produces an array of the speed errors that looks like this:
# speed_errors = [3, 2, 1, 0, 0, -2, -4, -3, -1, 1, 0]
#
# Positive speed_errors mean our car is going too fast, negative errors mean
# it's too slow. If the car is too slow or too fast for three seconds in a row,
# we want to make it more responsive.
#
# Write a function increase_responsiveness? that takes a speed_errors array and
# returns true if three consecutive errors are greater than zero or
# three consecutive errors are less than zero.
#
# test_drive_1 = [-1, -1, 2, 0, 1]
# increase_responsiveness?(test_drive_1) #=> false
#
# test_drive_2 = [0, 1, 2, 1, 0, -1]
# increase_responsiveness?(test_drive_2) #=> true

describe :increase_responsiveness? do
  context "When given an empty array" do
    it "returns false" do
      expect(increase_responsiveness?([])).to be(false)
    end
  end
  context "When given an array with one element" do
    it "returns false" do
      expect(increase_responsiveness?([1])).to be(false)
    end
  end
  context "When given an array with two elements" do
    it "returns false" do
      expect(increase_responsiveness?([1, 1])).to be(false)
    end
  end
  context "When given an array of zeroes" do
    it "returns false" do
      1.upto(20).each do |i|
        speed_errors = [0]*i
        expect(increase_responsiveness?(speed_errors)).to be(false), "failed input was #{speed_errors}"
      end
    end
  end
  context "When given an array of all negative elements" do
    it "returns true" do
      1.upto(4).each do |i|
        speed_errors = [-2, -1, -3]*i
        expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
      end
    end
  end
  context "When given an array of all positive elements" do
    it "returns true" do
      1.upto(4).each do |i|
        speed_errors = [8, 4, 7]*i
        expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
      end
    end
  end
  context "When given an array of alternating positive and negative elements" do
    context "and they alternate every other element [1, -1, 1, -1 ...]" do
      it "returns false" do
        2.upto(5).each do |i|
          speed_errors = [-2, 2]*i
          expect(increase_responsiveness?(speed_errors)).to be(false), "failed input was #{speed_errors}"
          speed_errors = [2, -2]*i
          expect(increase_responsiveness?(speed_errors)).to be(false), "failed input was #{speed_errors}"
        end
      end
    end
    context "and they alternate every two elements [1, 1, -1, -1, 1, 1 ...]" do
      it "returns false" do
        2.upto(5).each do |i|
          speed_errors = [-2, -2, 2, 2]*i
          expect(increase_responsiveness?(speed_errors)).to be(false), "failed input was #{speed_errors}"
          speed_errors = [2, 2, -2, -2]*i
          expect(increase_responsiveness?(speed_errors)).to be(false), "failed input was #{speed_errors}"
        end
      end
    end
  end
  context "When given an array of with three similar consecutive errors" do
    context "and the similar errors are in the middle of the array" do
      it "returns true" do
        1.upto(4).each do |i|
          speed_errors = [-2, 2]*i + [-3, -3, -3] + [2, -2]*i
          expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
          speed_errors = [2, -2]*i + [3, 3, 3] + [-2, 2]*i
          expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
          speed_errors = [0]*i + [3, 3, 3] + [0]*i
          expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
        end
      end
    end
    context "and the similar errors are at the beginning of the array" do
      it "returns true" do
        1.upto(4).each do |i|
          speed_errors = [-3, -3, -3] + [2, -2]*i
          expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
          speed_errors = [3, 3, 3] + [-2, 2]*i
          expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
          speed_errors = [3, 3, 3] + [0]*i
          expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
        end
      end
    end
    context "and the similar errors are at the end of the array" do
      it "returns true" do
        1.upto(4).each do |i|
          speed_errors = [-2, 2]*i + [-3, -3, -3]
          expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
          speed_errors = [2, -2]*i + [3, 3, 3]
          expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
          speed_errors = [0]*i + [3, 3, 3]
          expect(increase_responsiveness?(speed_errors)).to be(true), "failed input was #{speed_errors}"
        end
      end
    end
  end
end
