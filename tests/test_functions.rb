require "minitest/autorun"
require_relative '../functions.rb'
load '../local_env.rb' if File.exist?('../local_env.rb')

class Test_funcs < Minitest::Test
    
#     def test_1_and_1
#         assert_equal(1,1)
#     end
#     # <---tests for login---->

#         # def test_login
#         #     x = login_check?('test@email.com')
#         #     assert_equal(x,true)
#         # end

#         def test_login_false
#             x = login_check?('no_email@email.com')
#             assert_equal(x,false)
#         end
#     # <---test for get time---->
    
#         def test_get_time
#             x = get_time().length
#             assert_equal(x,2)
#         end

#         def test_get_time_return_type
#             x = get_time().class
#             assert_equal(Array,x)
#         end
#     # <----tests_for_pay_period()----> 

#         def test_payperiod_first
#             x = pay_period(Time.new(2017,10,31,15,42))
#             y = ["2017-10-30","2017-11-12"]
#             assert_equal(y,x)
#         end

#         def test_payperiod_second
#             x = pay_period(Time.new(2017,11,16,))
#             y = ["2017-11-13","2017-11-26"]
#             assert_equal(y,x)
#         end

#         def test_payperiod_latest_possible_time
#             x = pay_period(Time.new(2017,11,26,13,59,59))
#             y = ["2017-11-13","2017-11-26"]
#             assert_equal(y,x)
#         end

#         def test_payperiod_Earliest_possible_time
#             x = pay_period(Time.new(2017,11,13,0,0,0))
#             y = ["2017-11-13","2017-11-26"]
#             assert_equal(y,x)
#         end

#     # <---tests for time_converter--->

#         def test_time_converter
#             x = time_converter("02:08")
#             y = "02:08 am"
#             assert_equal(y,x)
#         end

#         def test_time_converter_2234
#             x = time_converter("22:34")
#             y = "10:34 pm"
#             assert_equal(y,x)
#         end

#         def test_time_converter_0012
#             x = time_converter("00:12")
#             y = "12:12 am"
#             assert_equal(y,x)
#         end

#     # <----tests for who is clocked in----> 

#         def test_who_is_clocked_in_multi_d_array
#             x = who_is_clocked_in()
#             assert_equal(2,x.count)
#         end

#         def test_who_is_clocked_in_return_type()
#             x = who_is_clocked_in()
#             assert_equal(Array,x.class)
#         end 
        
#     # <----test for database_info()---->
        
#         def test_database_info_whats_returned
#             x = database_info('TESTID')
#             assert_equal(["TEST","TEST"],x)
#         end

#         def test_datebase_info_names_2
#             x = database_info('TESTID').length
#             assert_equal(2,x)
#         end

#         def test_database_return_type
#             x = database_info('TESTID').class
#             assert_equal(Array,x)
#         end

#     #<----test for pull_in_and_out_time()---->
#         def test_pull_in_and_out_returns_array
#             x = pull_in_and_out_times("TESTID",pay_period(Time.new(2017,10,31,0,0,0)))
#             assert_equal(Array,x.class)
#         end

#     #<----test for live time ---->
#         def test_live_time_hour
#             x = live_time("03:00 2017-10-10","04:00 2017-10-10")
#             assert_equal([0,1,0],x)
#         end

#         def test_live_time_20_minutes
#             x = live_time("03:00 2017-10-10","03:20 2017-10-10")
#             assert_equal([0,0,20],x)
#         end

#         def test_live_time_1_day
#             x = live_time("03:00 2017-10-10","03:00 2017-10-11")
#             assert_equal([1,0,0],x)
#         end

#         def test_live_time_1_d_2_h_47_m
#             x = live_time("03:00 2017-10-10","05:47 2017-10-11")
#             assert_equal([1,2,47],x)
#         end

#         def test_live_time_2_d_23_h_59_m
#             x = live_time("03:00 2017-10-10","02:59 2017-10-13")
#             assert_equal([2,23,59],x)
#         end

#     #<!---Vacation time tests--->
#         def test_vac_time_1
#             x = vac_time().class
#             assert_equal(String,x)
#         end   
        
#         def test_vac_time_2
#             x = vac_time().class
#             assert_equal(String,x)
#         end    

#         def test_vac_time_length_1
#             x = vac_time().length
#             assert_equal(10,x)
#         end    

#         def test_vac_time_length_2
#             x = vac_time().length
#             assert_equal(10,x)
#         end    

#     #<!---submit time in section--->
#         def test_time_in_1
#             submit_time_in("TESTID","Clendenin","10:52","11/13/2017")
#             x = time_in_check?("TESTID")    
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             check = db.exec("Delete FROM timesheet_new WHERE user_id = 'TESTID' AND time_out = '11:15'")
#             db.close
#             assert_equal(false,x)
#         end

#         def test_time_in_2
#             submit_time_in("TESTID","Clendenin","12:02","11/14/2017")
#             x = time_in_check?("TESTID")    
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             check = db.exec("Delete FROM timesheet_new WHERE user_id = 'TESTID'")
#             db.close
#             assert_equal(false,x)
#         end

#         def test_time_in_3
#             submit_time_in("TESTID","Clendenin","1:48","11/13/2017")
#             x = time_in_check?("TESTID")    
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             check = db.exec("Delete FROM timesheet_new WHERE user_id = 'TESTID'")
#             db.close
#             assert_equal(false,x)
#         end

#         #<!---submit time out section--->
#         def test_time_ou_1
#             submit_time_in("TESTID","Clendenin","1:48","11/13/2017")
#             submit_time_out("TESTID","3:52","11/13/2017")
#             x = time_out_check?("TESTID")    
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             check = db.exec("Delete FROM timesheet_new WHERE user_id = 'TESTID'")
#             db.close
#             assert_equal(false,x)
#         end  
        
#         def test_time_ou_2
#             submit_time_in("TESTID","Clendenin","9:00 am","11/13/2017")
#             submit_time_out("TESTID","5:00 pm","11/13/2017")
#             x = time_out_check?("TESTID")    
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             check = db.exec("Delete FROM timesheet_new WHERE user_id = 'TESTID'")
#             db.close
#             assert_equal(false,x)
#         end  

#         #<!---getting user id section--->
#         def test_get_id_1
#             x = get_id("TEST@email.com")
#             assert_equal("TESTID",x)
#         end  
        
#         def test_get_id_2
#             x = get_id("test@email")
#             assert_equal("test",x)
#         end 

#         #<!---test add user--->
#         def test_add_user_1
#             delete_emp("testid258")
#             add_user('testid258',"testid258@email.com","258","line","0","devid","No","11/15/2017","Accounting","slackering","0","0")
#             x = get_id("testid258@email.com")
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#                 }
#                 db = PG::Connection.new(db_params)
#                 db.exec("Delete FROM info_new WHERE user_id = 'testid258'")  
#                 db.exec("Delete FROM pto WHERE user_id = 'testid258'")
#                 db.exec("Delete FROM admin_status WHERE user_id = 'testid258'")
#                 db.exec("Delete FROM email WHERE user_id = 'testid258'")
#                 db.close
#                 assert_equal("testid258", x)
#             end  
            
#             def test_add_user_2
#                 delete_emp("testid278")
#                 add_user('testid278',"testid278@email.com","278","line","0","devid","No","11/15/2017","Accounting","slackering","0","0")
#                 x = get_id("testid278@email.com")
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                     }
#                     db = PG::Connection.new(db_params)
#                     db.exec("Delete FROM info_new WHERE user_id = 'testid278'")  
#                     db.exec("Delete FROM pto WHERE user_id = 'testid278'")
#                     db.exec("Delete FROM admin_status WHERE user_id = 'testid278'")
#                     db.exec("Delete FROM email WHERE user_id = 'testid278'")
#                     db.close
#                     assert_equal("testid278", x)
#                 end        
    
#         #<!---test check time in section--->4
#         def test_check_time_in_1
#             submit_time_in("TESTID","Clendenin","12:02","11/14/2017")
#             x = time_in_check?("TESTID")    
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("Delete FROM timesheet_new WHERE user_id = 'TESTID'")
#             db.close
#             assert_equal(false,x)
#         end

#         def test_check_time_in_2
#             submit_time_in("jim","Clendenin","12:02","11/14/2017")
#             x = time_in_check?("jim")    
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("Delete FROM timesheet_new WHERE user_id = 'jim'")
#             db.close
#             assert_equal(false,x)
#         end


#     #<!---test time out check section--->
#         def test_time_out_check_1
#             submit_time_in("bill","Clendenin","9:00 am","11/14/2017")
#             submit_time_out("bill","5:00 pm","11/14/2017")
#             x = time_out_check?("bill")
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("Delete FROM timesheet_new WHERE user_id = 'bill'")
#             db.close
#             assert_equal(false,x) 
#         end 
        
#         def test_time_out_check_2
#             submit_time_in("hank","Clendenin","11:00 am","11/18/2017")
#             submit_time_out("hank","10:00 pm","11/18/2017")
#             x = time_out_check?("hank")
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("Delete FROM timesheet_new WHERE user_id = 'hank'")
#             db.close
#             assert_equal(false,x) 
#         end

#         #<!---test adim check--->
#             def test_admin_check_1
#                 delete_emp("testid368")
#                 add_user('testid368',"testid368@email.com","368","line","0","devid","No","11/15/2017","Accounting","slackering","0","0")
#                 x = database_admin_check("testid368")
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                     }
#                     db = PG::Connection.new(db_params)
#                     db.exec("Delete FROM info_new WHERE user_id = 'testid368'")  
#                     db.exec("Delete FROM pto WHERE user_id = 'testid368'")
#                     db.exec("Delete FROM admin_status WHERE user_id = 'testid368'")
#                     db.exec("Delete FROM email WHERE user_id = 'testid368'")
#                     db.close
#                     assert_equal("No",x)
#             end

#             def test_admin_check_2
#                 delete_emp("testid1234")
#                 add_user('testid1234',"testid@email.com","weee","haaa","0","devid","Yes","11/15/2017","Accounting","slackering","0","0")
#                 x = database_admin_check('testid1234')
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                     }
#                     db = PG::Connection.new(db_params)
#                     db.exec("Delete FROM info_new WHERE user_id = 'testid1234'")  
#                     db.exec("Delete FROM pto WHERE user_id = 'testid1234'")
#                     db.exec("Delete FROM admin_status WHERE user_id = 'testid1234'")
#                     db.exec("Delete FROM email WHERE user_id = 'testid1234'")
#                     db.close
#                     assert_equal("Yes",x)
#             end
        
#         # <--tests for database_emp_checked()-->
#             def test_emp_check_return_type
#                 x = database_emp_checked()
#                 assert_equal(Array,x.class)
#             end

#             def test_emp_check_multi_d_array
#                 x = database_emp_checked().first
#                 assert_equal(Array,x.class)
#             end
        
#         # <--test database_email_check()-->
#             def test_email_check_1
#                 user_id = 'testid415'
#                 email = "testemail@email.com"
#                 add_email(user_id,email)
#                 y = database_email_check(user_id)
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                     }
#                 db = PG::Connection.new(db_params)
#                 db.exec("DELETE FROM email WHERE user_id = '#{user_id}' ")
#                 db.close
#                 assert_equal(email,y)
#             end

#             def test_email_check_2
#                 user_id = 'test432'
#                 email = "test@email432.com"
#                 add_email(user_id,email)
#                 y = database_email_check(user_id)
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                     }
#                 db = PG::Connection.new(db_params)
#                 db.exec("DELETE FROM email WHERE user_id = '#{user_id}' ")
#                 db.close
#                 assert_equal(email,y)
#             end

#             def test_email_check_3
#                 user_id = 'test449'
#                 email = "test@email449.com"
#                 add_email(user_id,email)
#                 y = database_email_check(user_id)
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                     }
#                 db = PG::Connection.new(db_params)
#                 db.exec("DELETE FROM email WHERE user_id = '#{user_id}' ")
#                 db.close
#                 assert_equal(email,y)
#             end
            
#         # <--test for admin_emp_list()-->
#             def test_admin_emp_list_return_class
#                 x=admin_emp_list()
#                 assert_equal(Array,x.class)
#             end

#             def test_admin_emp_list_return_multi_d_arr
#                 x=admin_emp_list().first
#                 assert_equal(Array,x.class)
#             end

#             def test_admin_emp_list_multi_d_arr_of_strings
#                 x=admin_emp_list().first.first
#                 assert_equal(String,x.class)
#             end

#         # <--test for emp_info(user_id)-->

#             def test_emp_info_1
#                 user_id = 'testid484'
#                 email = "testid@email.com"
#                 fname = "test484"
#                 lname = "484test"
#                 pto = "5"
#                 vacation = "1"
#                 sick = "1"
#                 supervisor = "devId"
#                 admin_access = "No"
#                 doh = "11/15/2017"
#                 department="Marketing"
#                 job="Sales"
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 x=emp_info('testid484')
#                 delete_emp(user_id)
#                 answer = [user_id,fname,lname,email,pto,vacation,sick,doh,job,department,admin_access,supervisor]
#                 assert_equal(answer,x)
#             end

#             def test_emp_info_return_class
#                 user_id = 'testid484'
#                 email = "testid@email.com"
#                 fname = "test484"
#                 lname = "484test"
#                 pto = "5"
#                 vacation = "0"
#                 sick = "0"
#                 admin = "1"
#                 admin_access = "No"
#                 doh = "11/15/2017"
#                 department="Marketing"
#                 job="Sales"
#                 add_user(user_id,email,fname,lname,pto,admin,admin_access,doh,department,job,vacation,sick)
#                 x=emp_info('testid484')
#                 delete_emp(user_id)
#                 answer = [user_id,email,fname,lname,pto,admin,doh,department,job]
#                 assert_equal(Array,x.class)
#             end

#             def test_emp_info_2
#                 user_id = 'testid514'
#                 email = "testid@email.com"
#                 fname = "test514"
#                 lname = "514test"
#                 pto = "2"
#                 supervisor = "devId"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 department="Marketing"
#                 job="Sales"
#                 vacation = "0"
#                 sick = "0"
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 x=emp_info(user_id)
#                 delete_emp(user_id)
#                 answer = [user_id,fname,lname,email,pto,vacation,sick,doh,job,department,admin_access,supervisor]
#                 assert_equal(answer,x)
#             end
        
#         # <--tests for update_user(user_id, new_info)-->
#             def test_update_user_new_email
#                 user_id = 'testid551'
#                 email = "testid@email.com"
#                 fname = "test551"
#                 lname = "514test"
#                 pto = "2"
#                 vacation = "2"
#                 sick = "3"
#                 supervisor = "devId"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 new_email = "testid_538@email.ecom"
#                 department="Marketing"
#                 job="Sales"
#                 delete_emp(user_id)
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 new_info_arr = [user_id,fname,lname,new_email,pto,vacation,sick,doh,job,department,admin_access,supervisor]
#                 update_user(user_id,new_info_arr)
#                 x= emp_info(user_id)
#                 delete_emp(user_id)
#                 assert_equal(new_info_arr,x)
#             end

#             def test_update_user_new_first_name
#                 user_id = 'testid574'
#                 email = "testid@email.com"
#                 fname = "test574"
#                 lname = "574test"
#                 pto = "2"
#                 vacation = "2"
#                 sick = "3"
#                 supervisor = "devId"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 new_fname = "test556"
#                 department="Marketing"
#                 job="Sales"
#                 delete_emp(user_id)
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 new_info_arr = [user_id,fname,lname,email,pto,vacation,sick,doh,job,department,admin_access,supervisor]
#                 update_user(user_id,new_info_arr)
#                 x= emp_info(user_id)
#                 delete_emp(user_id)
#                 assert_equal(new_info_arr,x)
#             end

#             def test_update_user_new_last_name
#                 user_id = 'testid514'
#                 email = "testid@email.com"
#                 fname = "test514"
#                 lname = "514test"
#                 pto = "2"
#                 vacation = "2"
#                 sick = "3"
#                 supervisor = "devId"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 new_lname = "test574"
#                 department="Marketing"
#                 job="Sales"
#                 delete_emp(user_id)
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 new_info_arr = [user_id,fname,new_lname,email,pto,vacation,sick,doh,job,department,admin_access,supervisor]
#                 update_user(user_id,new_info_arr)
#                 x= emp_info(user_id)
#                 delete_emp(user_id)
#                 assert_equal(new_info_arr,x)
#             end

#             def test_update_user_new_doh
#                 user_id = 'testid514'
#                 email = "testid@email.com"
#                 fname = "test514"
#                 lname = "514test"
#                 pto = "2"
#                 vacation = "2"
#                 sick = "3"
#                 supervisor = "devId"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 new_doh = "10/16/2007"
#                 department="Marketing"
#                 job="Sales"
#                 delete_emp(user_id)
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 new_info_arr = [user_id,fname,lname,email,pto,vacation,sick,new_doh,job,department,admin_access,supervisor]
#                 update_user(user_id,new_info_arr)
#                 x= emp_info(user_id)
#                 delete_emp(user_id)
#                 assert_equal(new_info_arr,x)
#             end

#             def test_update_user_new_pto
#                 user_id = 'testid514'
#                 email = "testid@email.com"
#                 fname = "test514"
#                 lname = "514test"
#                 pto = "2"
#                 vacation = "2"
#                 sick = "3"
#                 supervisor= "devId"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 new_pto = "4"
#                 department="Marketing"
#                 job="Sales"
#                 delete_emp(user_id)
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 new_info_arr = [user_id,fname,lname,email,new_pto,vacation,sick,doh,job,department,admin_access,supervisor]
#                 update_user(user_id,new_info_arr)
#                 x= emp_info(user_id)
#                 delete_emp(user_id)
#                 assert_equal(new_info_arr,x)
#             end

#             def test_update_user_new_department
#                 user_id = 'testid666'
#                 email = "testid@email.com"
#                 fname = "test666"
#                 lname = "666test"
#                 pto = "2"
#                 vacation = "2"
#                 sick = "3"
#                 supervisor = "devId"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 department="Marketing"
#                 job="Sales"
#                 new_department = "Accounting"
#                 delete_emp(user_id)
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 new_info_arr = [user_id,fname,lname,email,pto,vacation,sick,doh,job,department,admin_access,supervisor]
#                 update_user(user_id,new_info_arr)
#                 x= emp_info(user_id)
#                 delete_emp(user_id)
#                 assert_equal(new_info_arr,x)
#             end

#             def test_update_user_new_job
#                 user_id = 'testid514'
#                 email = "testid@email.com"
#                 fname = "test514"
#                 lname = "514test"
#                 pto = "2"
#                 vacation = "2"
#                 sick = "3"
#                 supervisor = "devId"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 department="Marketing"
#                 job="Sales"
#                 new_job = "Design"
#                 delete_emp(user_id)
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 new_info_arr = [user_id,fname,lname,email,pto,vacation,sick,doh,new_job,department,admin_access,supervisor]
#                 update_user(user_id,new_info_arr)
#                 x= emp_info(user_id)
#                 delete_emp(user_id)
#                 assert_equal(new_info_arr,x)
#             end

#             def test_update_mutliple_items
#                 user_id = 'testid712'
#                 email = "testid@email.com"
#                 fname = "test712"
#                 lname = "712test"
#                 pto = "2"
#                 vacation = "2"
#                 sick = "3"
#                 supervisor = "devId"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 new_pto = "4"
#                 new_lname ="test630"
#                 new_email ="test630@email.com"
#                 department="Marketing"
#                 job="Sales"
#                 delete_emp(user_id)
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 new_info_arr = [user_id,fname,lname,email,pto,vacation,sick,doh,job,department,admin_access,supervisor]
#                 update_user(user_id,new_info_arr)
#                 x= emp_info(user_id)
#                 delete_emp(user_id)
#                 assert_equal(new_info_arr,x)
#             end

#             def test_update_mutliple_items_2
#                 user_id = 'testid514'
#                 email = "testid@email.com"
#                 fname = "test514"
#                 lname = "514test"
#                 pto = "2"
#                 vacation = "2"
#                 sick = "3"
#                 supervisor = "scottid"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 new_doh = "10/24/2008"
#                 new_fname ="test649"
#                 new_supervisor ="devId"
#                 department="Marketing"
#                 job="Sales"
#                 delete_emp(user_id)
#                 add_user(user_id,email,fname,lname,pto,supervisor,admin_access,doh,department,job,vacation,sick)
#                 new_info_arr = [user_id,new_fname,lname,email,pto,vacation,sick,new_doh,job,department,admin_access,new_supervisor]
#                 update_user(user_id,new_info_arr)
#                 x= emp_info(user_id)
#                 delete_emp(user_id)
#                 assert_equal(new_info_arr,x)
#             end

#     # <--tests for delete_emp(user_id)-->
        
#             def test_delete_emp_1
#                 user_id = 'testid514'
#                 email = "testid@email.com"
#                 fname = "test514"
#                 lname = "514test"
#                 pto = "2"
#                 vacation = "2"
#                 sick = "3"
#                 admin = "No"
#                 admin_access = "No"
#                 doh = "10/15/2007"
#                 department="Marketing"
#                 job="Sales"
#                 add_user(user_id,email,fname,lname,pto,admin,admin_access,doh,department,job,vacation,sick)
#                 delete_emp(user_id)
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                 }
#                 db = PG::Connection.new(db_params)
#                 check = db.exec("SELECT * FROM info_new WHERE user_id = '#{user_id}'")
#                 x = check.num_tuples.zero?
#                 db.close
#                 assert_equal(true,x)
#             end  

#             def test_delete_emp_2
#                 add_user("testid787","testid787@email.com","787","line","0","devid","No","11/15/2017","Accounting","slackering","0","0")
#                 delete_emp("testid787")
#                 user_id = "testid787"
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                 }
#                 db = PG::Connection.new(db_params)
#                 check = db.exec("SELECT * FROM info_new WHERE user_id = '#{user_id}'")
#                 x = check.num_tuples.zero?
#                 db.close
#                 assert_equal(true,x)
#             end
#         # <--tests for add_email(user_id,email)-->
        
#             def test_add_email_1
#                 user_id = "testid712"
#                 email = "testid712@email.com"
#                 add_email(user_id,email)
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                 }
#                 db = PG::Connection.new(db_params)
#                 check = db.exec("SELECT * FROM email WHERE email = '#{email}'")
#                 x = check.num_tuples.zero?
#                 db.exec("DELETE FROM email WHERE email = '#{email}'")
#                 db.close
#                 assert_equal(false,x)
#             end

#             def test_add_email_2
#                 user_id = "testid732"
#                 email = "testid732@email.com"
#                 add_email(user_id,email)
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                 }
#                 db = PG::Connection.new(db_params)
#                 x = db.exec("SELECT email FROM email WHERE email = '#{email}'").values.flatten.first
#                 db.exec("DELETE FROM email WHERE email = '#{email}'")
#                 db.close
#                 assert_equal(email,x)
#             end
            
                

#         # <--tests for time_out_lunch_check?(user_id)-->
#         def test_lunch_check_out
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             user_id = 'test758'
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','10:00 am','12:00 pm','N/A','N/A','2017-11-30','2017-11-30','N/A')")
#             x = time_out_lunch_check?(user_id)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = '#{user_id}' ")
#             db.close
#             assert_equal(false,x)
#         end

#         def test_lunch_check_out_return_true
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             user_id = 'test758'
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','10:00 am','N/A','N/A','N/A','2017-11-30','2017-11-30','N/A')")
#             x = time_out_lunch_check?(user_id)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = '#{user_id}' ")
#             db.close
#             assert_equal(true,x)
#         end
#         # <-- tests for get_users_pto_request(user_id) -->
        
#         def test_get_users_pto_request_return_array
#             user_id = 'test786'
#             start_date = '2017-11-20'
#             end_date = '2017-11-21'
#             approval = "pending"
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO pto_requests(user_id,start_date,end_date,approval)VALUES('#{user_id}','#{start_date}','#{end_date}','#{approval}')")
#             x = get_users_pto_request(user_id)
#             db.exec("DELETE FROM pto_requests WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal(Array,x.class)
#         end
        
#         def test_get_users_pto_request_return_multi_d_array
#             user_id = 'test786'
#             start_date = '2017-11-20'
#             end_date = '2017-11-21'
#             approval = "pending"
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO pto_requests(user_id,start_date,end_date,approval)VALUES('#{user_id}','#{start_date}','#{end_date}','#{approval}')")
#             x = get_users_pto_request(user_id)
#             db.exec("DELETE FROM pto_requests WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal(Array,x.first.class)
#         end

#         def test_get_users_pto_request_return_multi_d_array_of_strings
#             user_id = 'test786'
#             start_date = '2017-11-20'
#             end_date = '2017-11-21'
#             approval = "pending"
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO pto_requests(user_id,start_date,end_date,approval)VALUES('#{user_id}','#{start_date}','#{end_date}','#{approval}')")
#             x = get_users_pto_request(user_id)
#             db.exec("DELETE FROM pto_requests WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal(String,x.flatten.first.class)
#         end

#         def test_get_users_pto_request_return_1
#             user_id = 'test786'
#             start_date = '2017-11-20'
#             end_date = '2017-11-21'
#             approval = "pending"
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO pto_requests(user_id,start_date,end_date,approval)VALUES('#{user_id}','#{start_date}','#{end_date}','#{approval}')")
#             x = get_users_pto_request(user_id)
#             db.exec("DELETE FROM pto_requests WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal([[start_date,end_date,approval]],x)
#         end
#         # <--tests for pull_pto_request()-->
#         def test_pull_pto_request_return_arr
#             user_id = 'test866'
#             start_date = '2017-11-20'
#             end_date = '2017-11-21'
#             approval = "pending"
#             type = "sick"
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO pto_requests(user_id,start_date,end_date,approval,type_of_days)VALUES('#{user_id}','#{start_date}','#{end_date}','#{approval}','#{type}')")
#             x = pull_pto_request()
#             db.exec("DELETE FROM pto_requests WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal(Array,x.class)
#         end

#         def test_pull_pto_request_return_multi_d_arr
#             user_id = 'test866'
#             start_date = '2017-11-20'
#             end_date = '2017-11-21'
#             approval = "pending"
#             type = "Vacation"
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO pto_requests(user_id,start_date,end_date,approval,type_of_days)VALUES('#{user_id}','#{start_date}','#{end_date}','#{approval}','#{type}')")
#             x = pull_pto_request()
#             db.exec("DELETE FROM pto_requests WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal(Array,x.first.class)
#         end

#         def test_pull_pto_request_return_multi_d_arr_of_strings
#             user_id = 'test866'
#             start_date = '2017-11-20'
#             end_date = '2017-11-21'
#             approval = "pending"
#             type = "Pto"
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO pto_requests(user_id,start_date,end_date,approval,type_of_days)VALUES('#{user_id}','#{start_date}','#{end_date}','#{approval}','#{type}')")
#             x = pull_pto_request()
#             db.exec("DELETE FROM pto_requests WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal(String,x.flatten.first.class)
#         end

#         # <--pto_request_db_add(user_id,start_date,end_date)-->

#             def test_pto_request_db_add_1
#                 user_id = "test9281"
#                 start_date = "2017-11-20"
#                 end_date = "2017-11-23"
#                 type = "Pto"
#                 pto_request_db_add(user_id,start_date,end_date,type)
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                 }
#                 db = PG::Connection.new(db_params)
#                 check = db.exec("SELECT * FROM pto_requests WHERE user_id = '#{user_id}' AND start_date = '#{start_date}' AND end_date = '#{end_date}' AND approval = 'pending'")
#                 db.exec("DELETE FROM pto_requests WHERE user_id = '#{user_id}'")
#                 db.close
#                 x = check.num_tuples.zero?
#                 assert_equal(false,x)
#             end

#             def test_pto_request_db_add_2
#                 user_id = "test9281"
#                 start_date = "2017-11-20"
#                 end_date = "2017-11-23"
#                 type = "Sick"
#                 pto_request_db_add(user_id,start_date,end_date,type)
#                 db_params = {
#                     host: ENV['host'],
#                     port: ENV['port'],
#                     dbname: ENV['dbname'],
#                     user: ENV['user'],
#                     password: ENV['password']
#                 }
#                 db = PG::Connection.new(db_params)
#                 arr = db.exec("SELECT * FROM pto_requests WHERE user_id = '#{user_id}' AND start_date = '#{start_date}' AND end_date = '#{end_date}' AND approval = 'pending'").values
#                 db.exec("DELETE FROM pto_requests WHERE user_id = '#{user_id}'")
#                 db.close
#                 x = [[user_id,start_date,end_date,'pending',"Sick"]]
#                 assert_equal(arr,x)
#             end

#         # <--test for timetable_delete(user_id, date, time_in)-->
            
#         def test_timetable_delete_1
#             user_id = "test970"
#             date = "2017-11-20"
#             time_in = "10:00 am"
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','#{time_in}','12:00 pm','N/A','N/A','#{date}','2017-11-30','N/A')")
#             timetable_delete(user_id, date, time_in)
#             check = db.exec("SELECT * FROM timesheet_new WHERE user_id = '#{user_id}'")
#             x = check.num_tuples.zero?
#             db.close
#             assert_equal(true,x)
#         end

#         def test_timetable_delete_2
#             user_id = "test989"
#             date = "2017-12-22"
#             time_in = "10:30 am"
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','#{time_in}','12:00 pm','N/A','N/A','#{date}','2017-11-30','N/A')")
#             timetable_delete(user_id, date, time_in)
#             check = db.exec("SELECT * FROM timesheet_new WHERE user_id = '#{user_id}'")
#             x = check.num_tuples.zero?
#             db.close
#             assert_equal(true,x)
#         end

#     # <--tests for timetable_fix(user_id, date, time_in, new_time)-->
#         def test_timetable_fix_new_time_in
#             new_time_in = "9:00"
#             user_id = "test1009"
#             date = "2017-11-20"
#             time_in = "8:59"
#             lunch_start = "12:00"
#             lunch_end = "1:00"
#             time_out = "5:00"
#             date_out = "2017-11-20"
#             location = "Clendenin"
#             new_time = [new_time_in,lunch_start,lunch_end,time_out,date,date_out,location]
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','#{time_in}','#{lunch_start}','#{lunch_end}','#{time_out}','#{date}','#{date_out}','#{location}')")
#             timetable_fix(user_id, date, time_in, new_time)
#             x = db.exec("SELECT time_in,lunch_start,lunch_end,time_out,date,date_out,location FROM timesheet_new WHERE user_id = '#{user_id}'").values
#             db.exec("DELETE FROM timesheet_new WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal([new_time],x)
#         end

#         def test_timetable_fix_new_lunch_start
#             new_lunch_start = "12:30 pm"
#             user_id = "test1009"
#             date = "2017-11-20"
#             time_in = "8:59 am"
#             lunch_start = "12:00 pm"
#             lunch_end = "1:00 pm"
#             time_out = "5:00 pm"
#             date_out = "2017-11-20"
#             location = "Clendenin"
#             new_time = [time_in,new_lunch_start,lunch_end,time_out,date,date_out,location]
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','#{time_in}','#{lunch_start}','#{lunch_end}','#{time_out}','#{date}','#{date_out}','#{location}')")
#             timetable_fix(user_id, date, time_in, new_time)
#             x = db.exec("SELECT time_in,lunch_start,lunch_end,time_out,date,date_out,location FROM timesheet_new WHERE user_id = '#{user_id}'").values
#             db.exec("DELETE FROM timesheet_new WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal([new_time],x)
#         end

#         def test_timetable_fix_new_lunch_end
#             new_lunch_end = "12:30 pm"
#             user_id = "test1009"
#             date = "2017-11-20"
#             time_in = "8:59 am"
#             lunch_start = "12:00 pm"
#             lunch_end = "1:00 pm"
#             time_out = "5:00 pm"
#             date_out = "2017-11-20"
#             location = "Clendenin"
#             new_time = [time_in,lunch_start,new_lunch_end,time_out,date,date_out,location]
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','#{time_in}','#{lunch_start}','#{lunch_end}','#{time_out}','#{date}','#{date_out}','#{location}')")
#             timetable_fix(user_id, date, time_in, new_time)
#             x = db.exec("SELECT time_in,lunch_start,lunch_end,time_out,date,date_out,location FROM timesheet_new WHERE user_id = '#{user_id}'").values
#             db.exec("DELETE FROM timesheet_new WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal([new_time],x)
#         end

#         def test_timetable_fix_new_date
#             new_date = "2017-12-20"
#             user_id = "test1009"
#             date = "2017-11-20"
#             time_in = "8:59 am"
#             lunch_start = "12:00 pm"
#             lunch_end = "1:00 pm"
#             time_out = "5:00 pm"
#             date_out = "2017-11-20"
#             location = "Clendenin"
#             new_time = [time_in,lunch_start,lunch_end,time_out,new_date,date_out,location]
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','#{time_in}','#{lunch_start}','#{lunch_end}','#{time_out}','#{date}','#{date_out}','#{location}')")
#             timetable_fix(user_id, date, time_in, new_time)
#             x = db.exec("SELECT time_in,lunch_start,lunch_end,time_out,date,date_out,location FROM timesheet_new WHERE user_id = '#{user_id}'").values
#             db.exec("DELETE FROM timesheet_new WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal([new_time],x)
#         end

#         def test_timetable_fix_new_time_out
#             new_time_out = "4:30 pm"
#             user_id = "test1009"
#             date = "2017-11-20"
#             time_in = "8:59 am"
#             lunch_start = "12:00 pm"
#             lunch_end = "1:00 pm"
#             time_out = "5:00 pm"
#             date_out = "2017-11-20"
#             location = "Clendenin"
#             new_time = [time_in,lunch_start,lunch_end,new_time_out,date,date_out,location]
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','#{time_in}','#{lunch_start}','#{lunch_end}','#{time_out}','#{date}','#{date_out}','#{location}')")
#             timetable_fix(user_id, date, time_in, new_time)
#             x = db.exec("SELECT time_in,lunch_start,lunch_end,time_out,date,date_out,location FROM timesheet_new WHERE user_id = '#{user_id}'").values
#             db.exec("DELETE FROM timesheet_new WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal([new_time],x)
#         end

#         def test_timetable_fix_multiple_fixes
#             new_time_out = "4:30 pm"
#             new_time_in = "9:00 am"
#             new_lunch_end = "13:20 pm"
#             user_id = "test1009"
#             date = "2017-11-20"
#             time_in = "8:59 am"
#             lunch_start = "12:00 pm"
#             lunch_end = "1:00 pm"
#             time_out = "5:00 pm"
#             date_out = "2017-11-20"
#             location = "Clendenin"
#             new_time = [new_time_in,lunch_start,new_lunch_end,new_time_out,date,date_out,location]
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','#{time_in}','#{lunch_start}','#{lunch_end}','#{time_out}','#{date}','#{date_out}','#{location}')")
#             timetable_fix(user_id, date, time_in, new_time)
#             x = db.exec("SELECT time_in,lunch_start,lunch_end,time_out,date,date_out,location FROM timesheet_new WHERE user_id = '#{user_id}'").values
#             db.exec("DELETE FROM timesheet_new WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal([new_time],x)
#         end

#         def test_timetable_fix_multiple_fixes_2
#             new_time_out = "4:30 pm"
#             new_date = "2017-02-20"
#             new_date_out = "2017-02-20"
#             user_id = "test1009"
#             date = "2017-11-20"
#             time_in = "8:59 am"
#             lunch_start = "12:00 pm"
#             lunch_end = "1:00 pm"
#             time_out = "5:00 pm"
#             date_out = "2017-11-20"
#             location = "Clendenin"
#             new_time = [time_in,lunch_start,lunch_end,new_time_out,new_date,new_date_out,location]
#             db_params = {
#                 host: ENV['host'],
#                 port: ENV['port'],
#                 dbname: ENV['dbname'],
#                 user: ENV['user'],
#                 password: ENV['password']
#             }
#             db = PG::Connection.new(db_params)
#             db.exec("INSERT INTO timesheet_new(user_id,time_in,lunch_start,lunch_end,time_out,date,date_out,location)VALUES('#{user_id}','#{time_in}','#{lunch_start}','#{lunch_end}','#{time_out}','#{date}','#{date_out}','#{location}')")
#             timetable_fix(user_id, date, time_in, new_time)
#             x = db.exec("SELECT time_in,lunch_start,lunch_end,time_out,date,date_out,location FROM timesheet_new WHERE user_id = '#{user_id}'").values
#             db.exec("DELETE FROM timesheet_new WHERE user_id = '#{user_id}'")
#             db.close
#             assert_equal([new_time],x)
#         end
        

                
#         # <--tests for test lunch in--->
#         def test_submit_lunch_in_1
#             submit_time_in("tomsid","clendenin","8:00 am","11/16/2017")
#             submit_lunch_in("tomsid","12:00")
#             x = check_lunch_in("tomsid")
#             db_params = {
#                             host: ENV['host'],
#                             port: ENV['port'],
#                             dbname: ENV['dbname'],
#                             user: ENV['user'],
#                             password: ENV['password']
#                         }
#             db = PG::Connection.new(db_params)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = 'tomsid'")
#             db.close
#             assert_equal(false,x)
#         end 
        
#         def test_submit_lunch_in_2
#             submit_time_in("test0","clendenin","9:00 am","11/16/2017")
#             submit_lunch_in("test0","1:00 pm")
#             x = check_lunch_in("test0")
#             db_params = {
#                             host: ENV['host'],
#                             port: ENV['port'],
#                             dbname: ENV['dbname'],
#                             user: ENV['user'],
#                             password: ENV['password']
#                         }
#             db = PG::Connection.new(db_params)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = 'test0'")
#             db.close
#             assert_equal(false,x)
#         end 
        
#         # <!---test check lunch in section--->
#         def test_check_lunch_in_1
#             submit_time_in("test01","clendenin","8:00 am","11/22/2017")
#             submit_lunch_in("test01","12:00 pm")
#             x = check_lunch_in("test01")
#             db_params = {
#                             host: ENV['host'],
#                             port: ENV['port'],
#                             dbname: ENV['dbname'],
#                             user: ENV['user'],
#                             password: ENV['password']
#                         }
#             db = PG::Connection.new(db_params)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = 'test01'")
#             db.close
#             assert_equal(false,x)
#         end

#         def test_check_lunch_in_2
#             submit_time_in("bill0","clendenin","8:00 am","11/22/2017")
#             submit_lunch_in("bill0","12:00 pm")
#             x = check_lunch_in("bill0")
#             db_params = {
#                             host: ENV['host'],
#                             port: ENV['port'],
#                             dbname: ENV['dbname'],
#                             user: ENV['user'],
#                             password: ENV['password']
#                         }
#             db = PG::Connection.new(db_params)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = 'bill0'")
#             db.close
#             assert_equal(false,x)
#         end

#         # <!---test submit lunch out section--->
#         def test_submit_luch_out_1
#             submit_time_in("test01","clendenin","8:00 am","11/22/2017")
#             submit_lunch_in("test01","12:00 pm")
#             submit_lunch_out("test01","1:00 pm")
#             x = check_lunch_out("test01")
#             db_params = {
#                             host: ENV['host'],
#                             port: ENV['port'],
#                             dbname: ENV['dbname'],
#                             user: ENV['user'],
#                             password: ENV['password']
#                         }
#             db = PG::Connection.new(db_params)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = 'test01'")
#             db.close
#             assert_equal(false,x)
#         end

#         def test_submit_luch_out_2
#             submit_time_in("test011","clendenin","8:00 am","12/2/2017")
#             submit_lunch_in("test011","1:00 pm")
#             submit_lunch_out("test011","2:00 pm")
#             x = check_lunch_out("test011")
#             db_params = {
#                             host: ENV['host'],
#                             port: ENV['port'],
#                             dbname: ENV['dbname'],
#                             user: ENV['user'],
#                             password: ENV['password']
#                         }
#             db = PG::Connection.new(db_params)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = 'test011'")
#             db.close
#             assert_equal(false,x)
#         end

#         # <!---test check lunch out section--->
#         def test_submit_lunch_out_1
#             submit_time_in("0testid0","clendenin","8:00 am","12/24/2017")
#             submit_lunch_in("0testid0","1:00 pm")
#             submit_lunch_out("0testid0","2:00 pm")
#             x = check_lunch_out("0testid0")
#             db_params = {
#                             host: ENV['host'],
#                             port: ENV['port'],
#                             dbname: ENV['dbname'],
#                             user: ENV['user'],
#                             password: ENV['password']
#                         }
#             db = PG::Connection.new(db_params)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = '0testid0'")
#             db.close
#             assert_equal(false,x)
#         end

#         def test_submit_lunch_out_2
#             submit_time_in("danid2","clendenin","8:00 am","12/25/2017")
#             submit_lunch_in("danid2","1:00 pm")
#             submit_lunch_out("danid2","2:00 pm")
#             x = check_lunch_out("danid2")
#             db_params = {
#                             host: ENV['host'],
#                             port: ENV['port'],
#                             dbname: ENV['dbname'],
#                             user: ENV['user'],
#                             password: ENV['password']
#                         }
#             db = PG::Connection.new(db_params)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = 'danid2'")
#             db.close
#             assert_equal(false,x)
#         end

#         #<!---test pto time section--->
#         def test_pto_time_1
#             user_id = "tomhanksid"
#             x = pto_time(user_id)
#             assert_equal("8",x)
#         end

#         def test_pto_time_2
#             user_id = "lukeid"
#             x = pto_time(user_id)
#             assert_equal("7",x)
#         end

#         #<!---test time date fix section--->
#         def test_time_date_fix_1
#             submit_time_in("danid2","clendenin","8:00 am","12/25/2017")
#             submit_lunch_in("danid2","1:00 pm")
#             submit_lunch_out("danid2","2:00 pm")
#             submit_time_out("danid2","5:00 pm","12/25/2017")
#             x = time_date_fix("danid2","12/25/2017")
#             db_params = {
#                         host: ENV['host'],
#                         port: ENV['port'],
#                         dbname: ENV['dbname'],
#                         user: ENV['user'],
#                         password: ENV['password']
#                         }
#             db = PG::Connection.new(db_params)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = 'danid2'")
#             db.close
#             assert_equal([["8:00 am", "1:00 pm", "2:00 pm", "5:00 pm", "2017-12-25", "2017-12-25", "clendenin"]],x)
#         end 
        
#         def test_time_date_fix_2
#             submit_time_in("TEST007","clendenin","9:00 am","12/23/2017")
#             submit_lunch_in("TEST007","1:00 pm")
#             submit_lunch_out("TEST007","2:00 pm")
#             submit_time_out("TEST007","5:00 pm","12/23/2017")
#             x = time_date_fix("TEST007","12/23/2017")
#             db_params = {
#                         host: ENV['host'],
#                         port: ENV['port'],
#                         dbname: ENV['dbname'],
#                         user: ENV['user'],
#                         password: ENV['password']
#                         }
#             db = PG::Connection.new(db_params)
#             db.exec("DELETE FROM timesheet_new WHERE user_id = 'TEST007'")
#             db.close
#             assert_equal([["9:00 am", "1:00 pm", "2:00 pm", "5:00 pm", "2017-12-23", "2017-12-23", "clendenin"]],x)
#         end   

#     # <--test for time_zero_remove(time_arr)-->
#     def test_time_zero_remove_return_class
#         x =time_zero_remove(["1","14","30"])
#         assert_equal(String,x.class)
#     end

#     def test_time_zero_remove_1
#         x =time_zero_remove(["1","14","30"])
#         assert_equal("1 :day 14 :hours 30 :minutes",x)
#     end

#     def test_time_zero_remove_2_zero_days
#         x =time_zero_remove(["0","14","30"])
#         assert_equal("14 :hours 30 :minutes",x)
#     end

#     def test_time_zero_remove_3_zero_days_and_hours
#         x =time_zero_remove(["0","0","30"])
#         assert_equal("30 :minutes",x)
#     end 
    
#     def test_time_zero_remove_4_zero_hours
#         x =time_zero_remove(["1","0","30"])
#         assert_equal("1 :day 30 :minutes",x)
#     end 

#     def test_time_zero_remove_5_zero_minutes
#         x =time_zero_remove(["1","0","0"])
#         assert_equal("1 :day",x)
#     end

#     def test_time_zero_remove_6_zero_minutes_hours_days
#         x =time_zero_remove(["0","0","0"])
#         assert_equal("",x)
#     end

#     #<----- test timeoffbiuldup function area --------->
#     def test_timeoffbiuldup_1
#         user_id = "TESTID"
#         user_info = "none"
#         user_pto = "2"
#         hire_date = ["2017-10-31"]
#         pto_stamp = ["2017 12"]
#         user_vac = "2"
#         user_sic = "2"
#         todays_year_stamp = "2017"
#         todays_month_stamp = "12"
#         x = timeoffbiuldup(user_id,user_info,user_pto,hire_date,pto_stamp,user_vac,user_sic,todays_year_stamp,todays_month_stamp)
#         assert_equal("days have already been added",x)
#     end  
    
#     def test_timeoffbiuldup_2
#         user_id = "TESTID"
#         user_info = "none"
#         user_pto = "2"
#         hire_date = ["2017-10-31"]
#         pto_stamp = ["2017 11"]
#         user_vac = "2"
#         user_sic = "2"
#         todays_year_stamp = "2017"
#         todays_month_stamp = "12"
#         x = timeoffbiuldup(user_id,user_info,user_pto,hire_date,pto_stamp,user_vac,user_sic,todays_year_stamp,todays_month_stamp)
#         assert_equal("days were added lessthat2",x)
#     end 

#     def test_timeoffbiuldup_3
#         user_id = "TESTID"
#         user_info = "none"
#         user_pto = "2"
#         hire_date = ["1995-10-31"]
#         pto_stamp = ["2017 12"]
#         user_vac = "2"
#         user_sic = "2"
#         todays_year_stamp = "2017"
#         todays_month_stamp = "12"
#         x = timeoffbiuldup(user_id,user_info,user_pto,hire_date,pto_stamp,user_vac,user_sic,todays_year_stamp,todays_month_stamp)
#         assert_equal("days have already been added",x)
#     end 

#     def test_timeoffbiuldup_4
#         user_id = "TESTID"
#         user_info = "none"
#         user_pto = "2"
#         hire_date = ["1995-10-31"]
#         pto_stamp = ["2017 12"]
#         user_vac = "2"
#         user_sic = "2"
#         todays_year_stamp = "2018"
#         todays_month_stamp = "1"
#         x = timeoffbiuldup(user_id,user_info,user_pto,hire_date,pto_stamp,user_vac,user_sic,todays_year_stamp,todays_month_stamp)
#         assert_equal("days were added 2orlonger",x)
#     end 

#     def test_timeoffbiuldup_5
#         user_id = "bradyid"
#         user_info = "none"
#         user_pto = "2"
#         hire_date = ["2001-9-28"]
#         pto_stamp = ["2017 12"]
#         user_vac = "2"
#         user_sic = "2"
#         todays_year_stamp = "2017"
#         todays_month_stamp = "12"
#         x = timeoffbiuldup(user_id,user_info,user_pto,hire_date,pto_stamp,user_vac,user_sic,todays_year_stamp,todays_month_stamp)
#         assert_equal("days have already been added",x)
#     end

#     def test_timeoffbiuldup_6
#         user_id = "eastwoodid"
#         user_info = "none"
#         user_pto = "2"
#         hire_date = ["2016-8-10"]
#         pto_stamp = ["2017 8"]
#         user_vac = "2"
#         user_sic = "2"
#         todays_year_stamp = "2017"
#         todays_month_stamp = "12"
#         x = timeoffbiuldup(user_id,user_info,user_pto,hire_date,pto_stamp,user_vac,user_sic,todays_year_stamp,todays_month_stamp)
#         assert_equal("days were added lessthat2",x)
#     end

#     #-------------------status check test area------------------------
#     def test_status_check_1
#         user_id = "antID"
#         x = status_check(user_id)
#         assert_equal("removed",x)
#     end    

#     def test_status_check_2
#         user_id = "TESTID"
#         x = status_check(user_id)
#         assert_equal("No",x)
#     end 

#     def test_status_check_2
#         user_id = "lukeid"
#         x = status_check(user_id)
#         assert_equal("Yes",x)
#     end

    # #--------------------tests for Comments_filter----------------------
    # def test_comment_filters_no_blanks
    #     comments = {"comment1" => {
    #         'date' => "12-20-2017",
    #         'client' => "Woo",
    #         'comment' => "test"}
    #     }
    #     assert_equal(comments,comment_filter(comments))
    # end

    # def test_comment_filters_1_comment_1_blank
    #     comments = {"comment1" => {
    #         'date' => "12-20-2017",
    #         'client' => "",
    #         'comment' => "test"}
    #     }
    #     assert_equal("empty",comment_filter(comments))
    # end

    # def test_comment_filters_2_comments_no_blank
    #     comments = {"comment1" => {
    #         'date' => "12-20-2017",
    #         'client' => "woo",
    #         'comment' => "test"},

    #         "comment2" => {
    #         'date' => "12-20-2017",
    #         'client' => "woo",
    #         'comment' => "test2"}
    #     }
    #     assert_equal(comments,comment_filter(comments))
    # end

    # def test_comment_filters_2_comments_both_blanks
    #     comments = {"comment1" => {
    #         'date' => "12-20-2017",
    #         'client' => "woo",
    #         'comment' => "   "},

    #         "comment2" => {
    #         'date' => "",
    #         'client' => "woo",
    #         'comment' => "test2"}
    #     }
    #     assert_equal("empty",comment_filter(comments))
    # end

    # def test_comment_filters_2_comments_first_blank
    #     comments = {"comment1" => {
    #         'date' => "12-20-2017",
    #         'client' => "woo",
    #         'comment' => "   "},

    #         "comment2" => {
    #         'date' => "11-12-2018",
    #         'client' => "woo",
    #         'comment' => "test2"}
    #     }
    #     answer = {"comment2" => {'date' => "11-12-2018",'client' => "woo",'comment' => "test2"}}
    #     assert_equal(answer,comment_filter(comments)) 
    # end
    #-----------------------tests for comment_reformat()-----------------------
    # def test_comment_reformat_1_comment
    #           comments = {"comment1" => {
    #         'date' => "12-20-2017",
    #         'client' => "woo",
    #         'comment' => "comment test"},

    #         "comment2" => {
    #         'date' => "11-12-2018",
    #         'client' => "woo",
    #         'comment' => "test2"}
    #     }
    #     answer = {"woo"=>{"12-20-2017"=>["comment test"], "11-12-2018"=>["test2"]}}
    #     assert_equal(answer,comment_reformat(comments))
    # end

    # def test_comment_reformat_2_comments_same_date
    #     comments = {"comment1" => {
    #         'date' => "12-20-2017",
    #         'client' => "woo",
    #         'comment' => "comment test"},

    #         "comment2" => {
    #         'date' => "12-20-2017",
    #         'client' => "woo",
    #         'comment' => "test2"}
    #     }
    #     answer = {"woo"=>{"12-20-2017"=>["comment test",'test2']}}
    #     assert_equal(answer,comment_reformat(comments))
    # end

    # def test_comment_reformat_2_clients_same_dates
    #     comments = {"comment1" => {
    #         'date' => "12-20-2017",
    #         'client' => "woo",
    #         'comment' => "comment test"},

    #         "comment2" => {
    #         'date' => "12-20-2017",
    #         'client' => "woo2",
    #         'comment' => "test2"}
    #     }
    #     answer = {"woo"=>{"12-20-2017"=>["comment test"]}, "woo2"=>{"12-20-2017"=>["test2"]}}
    #     assert_equal(answer,comment_reformat(comments))
    # end
    
    #     # ---------------tests for end_of_week----------------------
    #     def test_end_of_week_1
    #         date = '2018-01-01'
    #         assert_equal('2018-01-07',end_of_week(date))
    #     end

    #     def test_end_of_week_2
    #         date = '2018-01-08'
    #         assert_equal('2018-01-14',end_of_week(date))
    #     end
    #     #--------------------test one week days-------------------------
    
    # def test_one_week_days
    #     date = '2018-01-08'
    #     answer = ['2018-01-08','2018-01-09','2018-01-10','2018-01-11','2018-01-12','2018-01-13','2018-01-14']
    #     assert_equal(answer,one_week_days(date))
    # end

    # def test_one_week_day_2
    #     date = '2018-01-15'
    #     answer = ['2018-01-15','2018-01-16','2018-01-17','2018-01-18','2018-01-19','2018-01-20','2018-01-21']
    #     assert_equal(answer,one_week_days(date))
    # end

    #-------------------------test for remove_quotes()---------------

        def test_remove_quotes()
            word = "'Mined Minds'"
            assert_equal('Mined Minds',remove_quotes(word))
        end

    #------------------------tests for get monday()--------------------
        
        def test_get_monday()
            date = "2018-1-10"
            assert_equal("2018-1-08",get_monday(date))
        end
    
    #--------Test for Checking Weekly Rate-----
        
        def test_weekly_rate
            user_id = bossid
            assert_equal("13.00", rate_check(user_id))
        end
end

