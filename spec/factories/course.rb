FactoryGirl.define do
  factory :course do
    title "Getting Started with MATLAB"
    description "Welcome to this MATLAB Video tutorial. If you have never used MATLAB before, this demonstration will get you started and show you where to go to next to learn more."
    image_url "http://www.mathworks.com/help/releases/R2014b/examples/matlab/ThreeDPlotsGSExample_01.png"
    url "http://www.mathworks.com/examples/matlab/3760-getting-started-with-matlab"
    association :source
  end
end
