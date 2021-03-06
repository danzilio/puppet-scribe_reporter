require 'puppet'
require 'puppet/reportallthethings/scribe_reporter'

Puppet::Reports.register_report(:scribe) do
  def process
    scribe = Puppet::ReportAllTheThings::ScribeReporter.new
    scribe.log(generate)
  end

  def generate
    JSON.pretty_generate(Puppet::ReportAllTheThings::Helper.report_all_the_things(self))
  end
end
