#！/bin/bash
#默认按空格分割
awk -F '{print $1,$2}' log.txt 

#按，分割 
# Field Separator
awk -F， '{print $1,$2}' log.txt
awk 'BEGIN{FS=","}{print $1,$2}' log.txt

#将第一个字段 占位8 第二个占用10
awk -F '{printf "%-8s %-10s\n" $1,$2}' log.txt

#运行.awk文件
awk -f file1.awk

#第一个字段>2
awk '$1>2' log.txt

#第一个字段==2 打印1，3字段
awk '$1==2 {print $1,$3}' log.txt

$0: 	这里是log.txt 记录本身
NR: 	number of records,用来表示行号；	在END中，这个表示所有记录总数
FNR： 	file number of records 有多个文件，将文件分别计行号
OFS: 	output file Separator
RS:		Record Separator 输入行分隔符 默认\n
ORS:	Out Record Separator 输出行分隔符 默认\n
NF：		Number of fields 



#打印 行号-->多少个字段
awk '{print NR, "-->", NF}' log.txt

#当awk读取多个文件时，NR 代表的是当前输入所有文件的全部记录数，而 FNR 则是当前文件的记录数
awk '{print FILENAME, "FNR= ", FNR,"  NR= ", NR}' student-marks bookdetails
student-marks FNR=  1   NR=  1
student-marks FNR=  2   NR=  2
student-marks FNR=  3   NR=  3
student-marks FNR=  4   NR=  4
student-marks FNR=  5   NR=  5
bookdetails FNR=  1   NR=  6
bookdetails FNR=  2   NR=  7
bookdetails FNR=  3   NR=  8
bookdetails FNR=  4   NR=  9
bookdetails FNR=  5   NR=  10


！ 取反
awk '$2 !~ /th/ {print $2,$4}' log.txt

#awk 数组
awk 'BEGIN{
	array["name"]="Alina";
	array["age"]="30";
	print array["name"] "\n"  array["age"]
}'

#awk 条件语句 if - else if
awk 'BEGIN{num=10; 
if (num % 2 == 0) printf "%d is even number", num;
else printf "%d is odd number", num
}'

awk 'if [[ condition ]]; then
	#statements
fi'


#awk for循环
awk 'BEGIN { for (( i = 0; i < 10; i++ )); do
	#statements
	print i
done
}'

#awk for循环 break
awk 'BEGIN { sum=0; for (( i = 0; i < 100; i++ )); do
	#statements
	sum += i;
	if (sum>50) 
		break;
	else
		print "Sum=",sum
done
}'

#awk while循环
awk 'BEGIN{ i=1
	while [[ i<6 ]]; do
	#statements
	print ++i
done
}'
