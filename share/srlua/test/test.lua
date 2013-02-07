#!/usr/local/bin/lua
-- test srlua

print("hello from inside "..arg[0])
print(#arg,...)
print"bye!"

print("hello again from inside "..arg[0])
for i=0,#arg do
	print(i,arg[i])
end
print"bye now!"
