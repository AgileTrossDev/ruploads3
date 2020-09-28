#!/usr/bin/env ruby

# Description:
# I use this to load large batches of large music files to S3.  It uses AWS SDK and requires
# credentials to be set in the environment


# Dependencies
require 'dotenv/load'
require 'aws-sdk-s3'

# Load Environment. NOTE: The .env file must contain
#    AWS_ACCESS_KEY_ID=your_access_key_id
#    AWS_SECRET_ACCESS_KEY=your_secret_access_key
Dotenv.load(".env")

puts "ruploaders3 started"

# TODO: Make Command line parameters 
bucket = "atd-music-swj"
the_dir = "/Users/sjackson/Downloads/lma/zip/"

music = Dir.children(the_dir)

s3 = Aws::S3::Resource.new(region:'us-east-1')

music.each do |m|
  puts "Uploading file: #{the_dir + m}"
  obj = s3.bucket(bucket).object(m)
  obj.upload_file(the_dir + m)
end

puts "ruploaders3 exiting"
