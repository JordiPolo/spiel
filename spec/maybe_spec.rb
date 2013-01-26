require 'spec_helper'

User = Struct.new(:name, :nickname, :father)

describe "Maybe" do
  let(:father) { User.new("Truusmis", nil, nil) }
  let(:gincho) { User.new("John", "gincho", father) }

  context "With nil object" do
    let(:name) {nil}
    subject { Maybe(name) }
    its(:nil?) { should be_true }
    its(:class) { should == Spiel::NothingClass }
    it "should return the default value for nil" do
      expect( subject.get_or_else("") ).to eq("")
    end
  end

  context "With nil in the chain" do
    subject { Maybe(gincho).father.nickname.gsub('uu', 'u') }
    its(:nil?) { should be_true }
    its(:class) { should == Spiel::NothingClass }
    it "should return the default value for nil" do
      expect( subject.get_or_else("") ).to eq("")
    end
  end

  context "With valid objects in the chain" do
    subject { Maybe(gincho).father.name.gsub('uu', 'u') }
    its(:nil?) { should be_false }
    its(:class) { should == Spiel::Just }
    it "should return the value of the object" do
      expect( subject.get_or_else("") ).to eq("Trusmis")
    end
  end

end
