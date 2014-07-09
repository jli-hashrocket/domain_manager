require 'spec_helper'

describe Account do
  it { should have_valid(:name).when('Jeff Li') }

  it { should have_many(:domains) }

end
