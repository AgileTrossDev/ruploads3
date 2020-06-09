#!/usr/bin/env ruby

# Dependencies
require 'dotenv/load'
require 'aws-sdk-s3'


# Set up
Dotenv.load(".env")

puts "ruploaders3 started"
 
bucket = "atd-music-swj"
the_dir = "/home/sjackson/Downloads/live_music_archive/"

music = Dir.children(the_dir)

s3 = Aws::S3::Resource.new(region:'us-east-1')

music.each do |m|
  puts "Uploading file: #{the_dir + m}"
  obj = s3.bucket(bucket).object(m)
  obj.upload_file(the_dir + m)
end

puts "ruploaders3 exiting"
