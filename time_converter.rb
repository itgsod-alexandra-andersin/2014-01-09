class TimeConverter

  def self.ad_to_posix_timestamp(ad_timestamp)
    ad_timestamp = ad_timestamp.to_i
    ad_unix_epoch_difference = 116444736000000000
    difference = ad_timestamp - ad_unix_epoch_difference
    nanoseconds_in_hundreds_per_second = 10000000
    return difference / nanoseconds_in_hundreds_per_second
  end

  def self.posix_timestamp_to_datetime(posix_timestamp)
  return Time.at(posix_timestamp).to_datetime
  end


  def self.ad_timestamp_to_datetime(ad_timestamp)
   posix_timestamp_to_datetime(ad_to_posix_timestamp(ad_timestamp))
  end
end