## Activity-Recognition
Multi-classification problem, LDA 
### 1.问题描述：
    如何通过可穿戴设备中的加速度计和陀螺仪所采集的运动信号数据，测量人们日常生活中的运动情况及其带来的卡路里消耗变得至关重要。研究人员充分考虑性别、年龄、身高、体重上的差异，选定14个受试人员并采集12种不同状态下（躺、坐、站立、步行、跑步、上楼梯、下楼梯等）的传感器数据，参见美国南加州大学的人体动作数据库USC-HAD（所采用的MotionNode传感器是一款6自由度的惯性测量单元，其采样频率为100Hz，三轴加速度计和陀螺仪均规定竖直向下为x轴正方向，前进方向为y轴正方向，水平向右为z轴正方向，且x轴垂直于y轴和z轴组成的平面）。基于上述采集数据，对运动中用户的传感器数据进行分类，判别传感器数据属于哪一种状态。


* Device Configuration
Device Type: MotionNode<br>
Sampling rate: 100Hz<br>
Accelerometer range: +-6g<br>
Gyroscope range: +-500dps<br>

### 2.数据格式：

>>> 1).传感器采集的样本数据：

For sensor_readings field, it consists of 6 readings:
From left to right:
acc_x, w/ unit g (gravity)
acc_y, w/ unit g
acc_z, w/ unit g
gyro_x, w/ unit dps (degrees per second)
gyro_y, w/ unit dps
gyro_z, w/ unit dps

2).标签数据：
运动状态包括12种，分别是，
Walking Forward
Walking Left
Walking Right
Walking Upstairs
Walking Downstairs
Running Forward
Jumping Up
Sitting
Standing
Sleeping
Elevator Up
Elevator Down

### 3.输入文件格式：
Each activity trial is stored in an .mat file.

The naming convention of each .mat file is defined as:
a"m"t"n".mat, where
"a" stands for activity
"m" stands for activity number
"t" stands for trial
"n" stands for trial number
 
Each .mat file contains 13 fields:
title: USC Human Motion Database
version: it is version 1.0 for this first round data collection
date
subject number
age
height
weight
activity name
activity number
trial number
sensor_location
sensor_orientation
sensor_readings

### 4.解决方案：
1).特征提取：从原始数据中提取统计特征并分析特征的有效性，共提取出61维特征。
2).特征降维（筛选）：融合所有特征必然会带来特征的冗余，需要进一步筛选从而达到特征降维的目的，采用线性判别法LDA的one-vs-all方式将61维特征降到30维。
3).分类识别：综合考虑kNN,SVM,基于决策树的随机森林算法三种分类器，根据各自的识别准确率及多数优先原则，给出未知类别的最终分类结果。
详细的解决方案见文档：解决方案.pdf。
