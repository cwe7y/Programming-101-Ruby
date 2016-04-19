class Lecture < ActiveRecord::Base
   has_many :tasks #aко не обявим тук асоциациите ActiveRecord няма да знае за тях.
end