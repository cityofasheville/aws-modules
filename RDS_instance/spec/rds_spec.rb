require 'spec_helper'

describe rds('mod') do
    it { should exist }
    it { should be_available }
    it { should belong_to_db_subnet_group('module.Subnet_Group.name') }
end
