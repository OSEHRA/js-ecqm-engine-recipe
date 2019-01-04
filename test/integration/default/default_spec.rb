describe service 'mongod' do
  it { should be_enabled }
  it { should be_running }
end

describe command 'cat /sys/kernel/mm/transparent_hugepage/enabled' do
  its('stdout') { should match /\[never\]/ }
end

describe command 'cat /sys/kernel/mm/transparent_hugepage/defrag' do
  its('stdout') { should match /\[never\]/ }
end