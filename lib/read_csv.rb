# Reads CSV file for record entry
require "csv"
module ReadCSV
  def form_csv_hash(csv)
    arr = []
    csv = CSV.read(csv, headers: true)
    csv.map do |row|
      arr << row.to_json
    end
    arr
  end
end
