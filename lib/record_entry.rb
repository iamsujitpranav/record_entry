require "record_entry/version"
require "perform_operations"
require "read_csv"


module RecordEntry
  class Error < StandardError; end

  # Reads content from the CSV file

  attr_accessor :csv, :operation

  def initialilze(csv, operation)
    @csv = csv
    @operation = operation
  end

  def process
    @conn = connection
    file_data.map do |row|
      start_operation 
    end
  rescue => e
    "Processing error #{e}"
  end

  def file_data
    form_csv_hash(csv)
  end

  def start_operation 
    case operation
    when :add
      add(row)
    when :delete
      delete(row)
    end
  end
end
