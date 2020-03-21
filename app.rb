require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
set :database, { adapter: "sqlite3", database: "mydb.db" }
require "./models/student"
require "./models/student_class"
require "./models/college_class"

get '/' do
    Student.all.to_yaml + CollegeClass.all.to_yaml + StudentClass.all.to_yaml
end

get '/students' do
    @students = Student.all
    erb :students
end

get '/student/:id' do
    @student = Student.find(params[:id])
    if @student.nil?
        return "Can not find the student"
    end
    erb :student
end

get '/classes' do
    @classes = CollegeClass.all
    erb :classes
end

get '/class/:id' do
    @class = CollegeClass.find(params[:id])
    if @class.nil?
        return "Can not find the class"
    end
    erb :class
end