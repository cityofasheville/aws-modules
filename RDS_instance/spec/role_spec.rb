require 'spec_helper'

describe iam_role('rds_enhanced_monitoring') do
    it { should exist }
    it { should be_allowed_action('sts:AssumeRole') }
    it { should have_iam_policy('AmazonRDSEnhancedMonitoringRole') }
end
