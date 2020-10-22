require 'spec_helper'

describe security_group('sg_on_rds_instance') do
  it { should exist }
  its(:outbound) { should be_opened }
end
