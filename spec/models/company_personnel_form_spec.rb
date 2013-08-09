require 'spec_helper'

describe CompanyPersonnelForm do

  it "has polymorhpic association with team_members" do
    cpf = CompanyPersonnelForm.create
    cpf.team_members.build(:first_name => 'Joe', :last_name => 'Team')
    cpf.save
    cpf.team_members.count.should == 1
  end

  it "has polymorhpic association with board_members" do
    cpf = CompanyPersonnelForm.create
    cpf.board_members.build(:first_name => 'Joe', :last_name => 'Board')
    cpf.save
    cpf.board_members.count.should == 1
  end

  it "has polymorhpic association with advisors" do
    cpf = CompanyPersonnelForm.create
    cpf.advisors.build(:first_name => 'Joe', :last_name => 'Advisor')
    cpf.save
    cpf.advisors.count.should == 1
  end

  it "should not get them mixed up" do
    cpf = CompanyPersonnelForm.create
    cpf.team_members.build(:first_name => 'Joe', :last_name => 'Team')
    cpf.board_members.build(:first_name => 'Joe', :last_name => 'Board')
    cpf.advisors.build(:first_name => 'Joe', :last_name => 'Advisor')
    cpf.save
    cpf.team_members.count.should == 1
    cpf.board_members.count.should == 1
    cpf.advisors.count.should == 1
  end
end
