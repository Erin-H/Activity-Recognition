# Activity-Recognition
Multi-classification problem, LDA 
### 1.问题描述：
如何通过可穿戴设备中的加速度计和陀螺仪所采集的运动信号数据，测量人们日常生活中的运动情况及其带来的卡路里消耗变得至关重要。研究人员充分考虑性别、年龄、身高、体重上的差异，选定14个受试人员并采集12种不同状态下（躺、坐、站立、步行、跑步、上楼梯、下楼梯等）的传感器数据，参见美国南加州大学的人体动作数据库USC-HAD（所采用的MotionNode传感器是一款6自由度的惯性测量单元，其采样频率为100Hz，三轴加速度计和陀螺仪均规定竖直向下为x轴正方向，前进方向为y轴正方向，水平向右为z轴正方向，且x轴垂直于y轴和z轴组成的平面）。基于上述采集数据，对运动中用户的传感器数据进行分类，判别传感器数据属于哪一种状态。
# 
Device Configuration<br>
Device Type: MotionNode<br>
Sampling rate: 100Hz<br>
Accelerometer range: +-6g<br>
Gyroscope range: +-500dps<br>

### 2.数据格式：

1).传感器采集的样本数据：
#
For sensor_readings field, it consists of 6 readings:<br>
From left to right:<br>
acc_x, w/ unit g (gravity)<br>
acc_y, w/ unit g<br>
acc_z, w/ unit g<br>
gyro_x, w/ unit dps (degrees per second)<br>
gyro_y, w/ unit dps<br>
gyro_z, w/ unit dps<br>

>> 2).标签数据：
运动状态包括12种，分别是，<br>
Walking Forward<br>
Walking Left<br>
Walking Right<br>
Walking Upstairs<br>
Walking Downstairs<br>
Running Forward<br>
Jumping Up<br>
Sitting<br>
Standing<br>
Sleeping<br>
Elevator Up<br>
Elevator Down<br>

### 3.输入文件格式：
Each activity trial is stored in an .mat file.<br>

The naming convention of each .mat file is defined as:<br>
a"m"t"n".mat, where<br>
"a" stands for activity<br>
"m" stands for activity number<br>
"t" stands for trial<br>
"n" stands for trial number<br>
 
Each .mat file contains 13 fields:<br>
title: USC Human Motion Database<br>
version: it is version 1.0 for this first round data collection<br>
date<br>
subject number<br>
age<br>
height<br>
weight<br>
activity name<br>
activity number<br>
trial number<br>
sensor_location<br>
sensor_orientation<br>
sensor_readings<br>

### 4.解决方案：
1).特征提取：从原始数据中提取统计特征并分析特征的有效性，共提取出61维特征。<br>
2).特征降维（筛选）：融合所有特征必然会带来特征的冗余，需要进一步筛选从而达到特征降维的目的，采用线性判别法LDA的one-vs-all方式将61维特征降到30维。<br>
3).分类识别：综合考虑kNN,SVM,基于决策树的随机森林算法三种分类器，根据各自的识别准确率及多数优先原则，给出未知类别的最终分类结果。<br>
>详细的解决方案见文档：解决方案.pdf。
