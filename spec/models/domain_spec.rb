require 'spec_helper'

describe Domain do
  it { should have_valid(:hostname).when('http://localhost:3000') }
  it { should have_valid(:account_id).when(1) }

  it { should belong_to(:account) }


end
