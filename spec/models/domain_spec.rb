require 'spec_helper'

describe Domain do
  it { should have_valid(:hostname).when('http://localhost:3000') }
  it { should have_valid(:account_id).when(1) }
  it { should have_valid(:ip_address).when('127.0.0.1') }

  it { should_not have_valid(:hostname).when('') }
  it { should_not have_valid(:account_id).when('') }
  it { should_not have_valid(:ip_address).when('') }

  it { should belong_to(:account) }

  context 'gets ip address' do
    it 'should return an ip address when hostname is given' do
      ip = Domain.get_ip('google.com')
      expect(ip).to eql('74.125.228.103')
    end
  end
end
