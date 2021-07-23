require 'minitest/autorun'
require_relative 'convert'

# Test for convert class
class TestConvert < Minitest::Test
  def setup
    @convert = CidrMaskConvert.new
    @validate = IpValidate.new
  end

  def test_valid_cidr_to_mask
    assert_equal '80 00 00 00', @convert.cidr_to_mask('1')
    assert_equal 'FF FF 00 00', @convert.cidr_to_mask('16')
    assert_equal 'FF FF F8 00', @convert.cidr_to_mask('21')
    assert_equal 'FF FF FF FF', @convert.cidr_to_mask('32')
  end

  def test_valid_mask_to_cidr
    assert_equal '1', @convert.mask_to_cidr('80 00 00 00')
    assert_equal '16', @convert.mask_to_cidr('FF FF 00 00')
    assert_equal '21', @convert.mask_to_cidr('FF FF F8 00')
    assert_equal '32', @convert.mask_to_cidr('FF FF FF FF')
  end

  def test_invalid_cidr_to_mask
    assert_equal 'Invalid', @convert.cidr_to_mask(-1)
    assert_equal 'Invalid', @convert.cidr_to_mask(33)
    assert_equal 'Invalid', @convert.cidr_to_mask(0)
  end

  def test_invalid_mask_to_cidr
    assert_equal 'Invalid', @convert.mask_to_cidr('0.0.0.0')
    assert_equal 'Invalid', @convert.mask_to_cidr('0.0.0.0.0')
    assert_equal 'Invalid', @convert.mask_to_cidr('255.255.255')
    assert_equal 'Invalid', @convert.mask_to_cidr('11.0.0.0')
  end

  def test_valid_ipv4
    assert  @validate.ipv4_validation('127.0.0.1')
    assert  @validate.ipv4_validation('0.0.0.0.0')
    assert  @validate.ipv4_validation('192.168.0.1')
    assert  @validate.ipv4_validation('255.255.255')
  end

  def test_invalid_ipv4
    assert  false, @validate.ipv4_validation('192.168.1.2.3')
    assert  false, @validate.ipv4_validation('a.b.c.d')
    assert  false, @validate.ipv4_validation('255.256.250.0')
    assert  false, @validate.ipv4_validation('....')
  end
end
