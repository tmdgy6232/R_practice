a <- 1  # (변수 생성 및 초기화)
a + 2

b <- 3.5

# 여러값을 담는 변수
var1 <- c(1, 2, 3, 4, 5)

var2 <- c(1:5)

var3 <- seq(1, 11, by=2)

sum = var1 + var2

# 문자열 변수

str <- "a"
str2 <- 'b'

str + str2 # 문자열 연산 안됨? 

str3 <- c('a', 'b', 'c')
str4 <- c('Hello', 'World', 'Python')

# 함수()
mean(var1)

max()
min()
sum()
avg()

# 문자열 다루는 함수
paste(str4, collapse = ',')

# Java  -> Library
# Python -> module
# R -> Package

# * R에서 패키지 사용하는 방법
# ggplot2는 시각화 Package
# 1.R의 패키지 설치
install.packages("ggplot2")
# 2.패키지 import/load
library(ggplot2)
# 3.사용하기

x <- c('a', 'a', 'b', 'c')
x

# 빈도 막대 그래프 출력
qplot(x)

# ggplot2의 mpg 데이터로 그래프 만들기
# 보통 패키지 안에는 연습할 수 있게 기본 데이터셋이 첨부되어 있음

# mpg : 미국 환경 보호국에서 공개한 자료 1999~2008년 사이 미국에서 출시한 자동차 234종의 연비관련 정보

# hwy: 고속도로 연비
qplot(data = mpg, x = hwy)

# x출 cty: 도심 연비
qplot(data = mpg, x = cty)

# x축 drv, y축 hwy
qplot(data = mpg, x = drv, y = cty)

# 선그래프
qplot(data = mpg, x = drv, y = cty, geom='line')

# 상자그림 그래프
qplot(data = mpg, x = drv, y = cty, geom='boxplot')

# 상자그림 그래프, drv별 색 표현
qplot(data = mpg, x = drv, y = cty, geom='boxplot', colour = drv)

# 4. 데이터 프레임
# - 행이 많은 데이터
# -> 데이터 건수가 많음, 컴퓨터가 느려짐
# -> 고급사양 장비 구축 피룡

# - 열이 많은 데이터
# -> 분석방법의 한계
# -> 고급 분석방법

# 1. 변수 만들기
english <- c(90, 78, 80, 66) #영어 점수
math <- c(50, 60, 100, 45) #수학 점수
kr <- c(60, 100, 40, 99) # 국어 점수

# 2. 데이터프레임 만들기1
df_midterm <- data.frame(english, math, kr)
df_midterm

class <- c(1, 1, 2, 2)
df_midterm <- data.frame(english, math, kr, class)
df_midterm

# 데이터프레임 안 평균값 보기 $변수 
mean(df_midterm$english)
mean(df_midterm$math)
mean(df_midterm$kr)

# 2.데이터프레임 만들기2
df_midterm <- data.frame(english = c(90, 60, 40, 50),
                         math = c(60, 49, 90, 100),
                         kr = c(99, 100, 66, 78),
                         class= c(1, 1, 2, 2))

df_midterm


# 외부 데이터 이용하기
# url: bit.ly/doit_ra
# 파일 다운로드

# R에서 엑셀을 사용하기 위한 패키지 설치
install.packages('readxl')
library(readxl)

# 파일이 프로젝트 내에 존재하면 파일이름으로 호출 가능
# but 파일이 외부에 존재하면 'D:\\r_workspace\easy_r\xecel_exam.xlsx'
df_exam <- read_excel('excel_exam.xlsx')
df_exam

mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science)

# 제목열이 없는 Excel파일 불러오기

# 기존과 똑같이 불러오면 제목열로 만들어서 첫번째 열 데이터가 유실되는 상황이 발생
df_exam_novar <- read_excel('excel_exam_novar.xlsx')
df_exam_novar

df_exam_novar2 <- read_excel('excel_exam_novar.xlsx', col_names = F)
df_exam_novar2

# 엑셀파일에 시트가 여러개 있는 경우
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

# CSV(comma-separated values) 파일 불러오기
df_csv_exam <- read.csv('csv_exam.csv', stringsAsFactors = F)
df_csv_exam

# 문자가 들어있는 CSV파일을 불러올 때 주의할 점!
# stringsAsFactors = F
# R: datatype => Factor 이라는 타입이 있음
# Factor Type 이란?
#  남녀 컬럼
# 남
# 여
# 남
# 남
# 여
# 여
# 남

# Factor Type 예시
# 성별 : 남, 여
# 구동방식 : 4, f, r
# 중국집 :  짜장면, 짬봉
# 덮밥: 짜장, 카레, 하이라이스


# csv 파일로 저장하기

# dv_midterm -> csv 파일 생성
write.csv(df_midterm, file='df_midterm.csv' )

# R끼리 데이터를 주고 받을 때 
# excel, csv 파일말고 R만 사용할경우
# Rdata type으로 보내면 속도 향상
save(df_midterm, file='df_midterm.rda')

# 불러오기 전에 Data에서 삭제
rm(df_midterm)
# 확인
df_midterm

# 불러오기 
load('df_midterm.rda')
df_midterm

# 5단원: 데이터 파악하기 
exam <- read.csv('csv_exam.csv')
exam
# 데이터 파악함수
# head()
# tail()
# view()
# dim()
# str()
# summary()

head(exam) # default :  6건 
tail(exam) # default : 6건

head(exam, 20)  # 더 많이 불러오고 싶을 때

library('ggplot2')
mpg # 데이터가 많아서 다 불러오지 못함
View(mpg) # 생략된 데이터를 보고 싶을 때 View함수 사용

# dim() = 데이터가 몇행, 몇열로 구성되어 있는지 확인
dim(exam)

# str() = 데이터의 속성 파악
str(exam)

# summary() = 요약 통계량
summary(exam) 

# 1st Qu(1사분위수): 하위 25% 지점
# 3rd Qu(3사분위수): 하위 75% 지점


# 변수명 바꾸기
df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))

# dplyr 패키지
install.packages('dplyr')
library('dplyr')

df_new <- df_raw

#rename이라는 함수를 써서 column 이름 변경
df_new <- rename(df_new, v2 = var2)
df_new

# 파생변수 만들기
# : 평균, 총합, 기타 등등

df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df

# 총합 만들기 
df$var_sum <- df$var1 + df$var2
df

# 나누기 만들기
df$var_mean <- (df$var1 + df$var2)/2
df




# mpg데이터 사용

# 통합연비 만들기 (hwy + cty)
mpg$total <- (mpg$cty + mpg$hwy)/2

View(mpg)

# 조건을 통한 파생변수 만들기
summary(mpg$total)

hist(mpg$total)

# 연비가 20 이상이면 
mpg$test <- ifelse(mpg$total >= 20, 'pass', 
                   ifelse(mpg$total <= 10, 'trash', 'fail'
                   ))

table(mpg$test)
qplot(mpg$test)

#연비 종류
# A : 30이상
# B : 20~29
# C : 20미만
mpg$grade <- ifelse(mpg$total >= 30, 'A',
                    ifelse(mpg$total >= 20, 'B', 'c'))


table(mpg$grade)
qplot(mpg$grade)


# ** 6단원: 데이터 가공하기 - dplyr 패키지
# **filter() 행 추출
# **select() 열 추출
# **agrrange() 정렬 
# **mutate() 변수추가(파생변수)
# **summarise() 통계치 산출
# **group_by() 집단별로 그룹핑
# left_join() 데이터 합치기(열)
# bind_rows() 데이터 합치기(행)

library('dplyr')
exam <- read.csv('csv_exam.csv')
exam

# filter() : 행추출  (파이프 연산 : &>%)
exam %>% filter(class == 1) # class가 1반
exam %>% filter(class != 3) # class에서 3반 빼고 
exam %>% filter(math >= 60) # 수학이 점수가 60점 이상인 
exam %>% filter(class == 1 & math <= 60)# class가 1반이면서 수학점수가 60점이상
exam %>% filter(math >= 60 | english >= 60)
# 변수에 담고 싶을때
class1 <- exam %>% filter(math >= 60 | english >= 60)

#문제
# q1) 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고한다. displ(배기량          )이 4이하인 자동차와 5이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비) 가         평균적으로 높은지 알아보세요.

mpg_a <- mpg %>% filter(displ <= 4)
mpg_b <- mpg %>% filter(displ >= 5)

mean(mpg_a$hwy)
mean(mpg_b$hwy)

# q2) 자동차 제조회사에 따라 도시 연비가 다른지 알아보려고 한다. 'audi'와               'toyota' 중 어느 manufacturer(자동차 제조회사)의 cty(도시 연비)가                 평균적으로 더 높은지 알아보세요

mpg_audi <- mpg %>% filter(manufacturer == 'audi')
mpg_toyota <- mpg %>% filter(manufacturer == 'toyota')

mean(mpg_audi$cty)
mean(mpg_toyota$cty)

# q3) 'chevrolet', 'ford', 'honda' 자동차의 고속도로 연비 평균을 알아보고자 한다         . 
mpg_three <- mpg %>%
  filter(manufacturer == 'chevrolet' |
           manufacturer == 'ford' |
           manufacturer == 'honda')

View(mpg_three)

mpg_three <- mpg %>%
  filter(manufacturer %in% c('chevrolet',
                             'ford',
                             'honda'))

mean(mpg_three$hwy)


# select() : 열추출
exam %>% select(math) # 한 개의 열을 추출 
exam %>% select(math, english, science) # 여러 개의 열을 추출
exam %>% select(-math, -english) # 특정 열을 빼고 추출하고 싶을 때 -

# select 와 필터를 같이 쓰고 싶을 때
exam %>% 
  filter(class == 1) %>% 
  select(english) %>%
  head(3) # 추가 상위 3등까지 보고 싶을 때

# q1) mpg 데이터는 1개 변수로 구성되어 있다. 이중 일부만 추출해 분석에 활용하려고 한다. mpg 데이터에서 class, cty만 추출해서 새로운 변수를 생성하시오.
mpg_new <- mpg %>% select(class, cty)

# q1) 자동차 종류에 따라 도시 연비가 다른지 알아보려고 한다. 앞에서 추출한 데이터를 이용해서 class가 'suv'인 자동차와 'compact'인 자동차 중 어떤 자동차의 cty가 높은지 알아보자.

df_com <- mpg_new %>% filter(class == 'compact')
mean(df_com$cty)

df_suv <- mpg_new %>% filter(class == 'suv')
mean(df_suv$cty)


# arrange() :  정렬
exam %>% arrange(math) # default: 오름차순
exam %>% arrange(desc(math)) # desc() = 내림차순
exam %>% arrange(math, english) # 정렬조건 2개

# q1) audi에서 생산한 자동차 중에 어떤 자동차 모델의 hwy가 높은지 알아보려고 한다. audi에서 생상한 자동차중 hwy가 1~5위에 해당하는 자동차 데티를 출력하세요

mpg %>% filter(manufacturer == 'audi') %>%
  arrange(desc(hwy)) %>%
  head(5)

# mutate() : 변수추가(파생변수)
exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>%
  arrange(desc(total)) %>%
  head

exam %>%
  mutate(test = ifelse(science >= 60, "pass", 'fail')) %>%
  head

# q1) mgp() 데이터의 복사본을 만들고 cty와 hwy를 더한 '합산 연비 변수'를 추가하세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new <- mpg_new %>%
  mutate(total = cty + hwy)

# q2) 앞에서 만든 합산연비변수를 2로 나눠 평균 연비변수를 추가하세요.
mpg_new <- mpg_new %>% 
  mutate(mean =  total / 2)

# q3) 평균연비변수가 가장 높은 자동차 3종의 데이터를 출력하세요.
mpg_new %>%
  arrange(desc(mean)) %>%
  head(3)

# q4) 1~3번 문제를 해결할 수 있는 하나로 연결된 dplyr구문을 만들어 실해애보세요. 데이터는 복사본 대신 mpg 원본을 이용하세요

mpg %>% 
  mutate(total = cty+hwy,
         mean = total/2 ) %>%
  arrange(desc(mean)) %>%
  head(3)


# summarise() : 통계치 산출 (group_by()와 같이 쓰임 sql havving절과 비슷)
exam %>% summarise(mean_math = mean(math))

# group_by() : 집단별로 그루핑
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math), # 평균
            sum_math = sum(math), # 합계
            median_math = median(math), # 중앙값
            student = n()) # 학생수

mpg %>% 
  group_by(manufacturer, drv) %>% # 1.제조사로 그룹핑 2.구동방식으로 다시 한번 그룹핑
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(10)


# q1) 회사별로 'suv' 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순 정렬하고, 1~5위까지 출력하기

mpg %>%
  group_by(manufacturer) %>%
  filter(class == 'suv') %>%
  mutate(tot = (cty+hwy)/2) %>%
  summarise(mean_tot = mean(tot)) %>%
  arrange(desc(mean_tot)) %>%
  head(5)

# q1) mpg 데이터의 class는 'suv', 'compact'등 자동차를 특징에 따라 일곱 종류로 분류한 변수입니다. 어떤 차종의 도시 연비가 높은지 비교해보려고 합니다. class별 cty 평균을 구해보세요.
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty))


# q2) 앞 문제의 출력 결과는 class 값 알파벳 순으로 정렬되어 있습니다. 어떤 차종의 도시 연비가 높은지 쉽게 알아볼 수 있도록 cty 평균이 높은 순으로 정렬해 출력하세요.
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))
# q3) 어떤 회사 자동차의 hwy가 가장 높은 지 알아보려고 합니다. hwy 평균이 가장 높은 회사 세곳을 출력하세요.
mpg %>% 
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

# q4) 어떤 회사에서 'compact' 차종을 가장 많이 생산하는지 알아보려고 합니다. 각 회사별 'compact' 차종 수를 내림차순으로 정려해 출력하세요.
library(dplyr)
mpg %>%
  filter(class == 'compact') %>%
  group_by(manufacturer) %>%
  summarise(count = n()) %>%
  arrange(desc(count))


# left_join() : 데이터 합치기(열)
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90,85))

# 기말고사 데이터 생성

test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    finalterm = c(70, 89, 99, 100, 70))

test1
test2
total <- left_join(test1, test2, by='id')
total

name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c('kim', 'choi', 'lee', 'park', 'jung'))

exam_new <- left_join(exam, name, by = 'class')
exam_new


# bind_rows() : 데이터 합치기(행)
# 학생 1-5번 시험 데이터 생성
group_a <- data.frame(id= c(1, 2, 3, 4, 5),
                      test = c(60, 70, 80, 100, 100))

group_b <- data.frame(id= c(1, 2, 3, 4, 5),
                      test = c(65, 74, 83, 100, 99))

# 합치기전 주의  : 데이터 프레임의 컬럼이름과 수가 동일해야함
# but 컬럼명이 다른 프레임을 세로로 합치고 싶으면 어떻게 해야될까요?

group_all <- bind_rows(group_a, group_b)
group_all

# mpg 데이터의 fl 변수는 자동차에 사용하는 연료(fuel)을 의미합니다. 오른쪽은 자동차 연료별 가격을 나타낸 표입니다.
# fl 연료종류     연료가격
# c CNG           2.35
# d diesel        2.38
# e ethanol E85   2.1
# p premium       2.76
# r reqular       2.22

# 연료종류를 제외한 나머지 column을 포함하는
# 데이터프레임을 생성하시오.(열제목 fl, price_fl)

fuel <- data.frame(f1 = c('c', 'd', 'e', 'p', 'r'),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22 ),
                   stringsAsFactors = F)  
fuel

# q1) mpg 데이터에는 연료 종류를 나타낸 fl변수는 있지만 연료 가격을 나타낸 변수는 없다. 위에서 만든 fuel 데이터를 이용해 mpg 데이터에 price_fl(연료 가격) 변수를 추가하세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg <- left_join(mpg, fuel, by = 'fl')
# q2) 연료 가격 변수가 잘 추가됐는지 확인하기 위해 model, fl, price_fl 변수를 추출해 앞부분 5행만 출력해보세요.

mpg %>%
  select(model, fl, price_fl) %>%
  head(5)


# midwest 데이터셋
# : 미국 동부중부 437개 지역의 인구통계 정보

midwest <- as.data.frame(ggplot2::midwest)
View(midwest)

# q1) pupadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타낸다. midwest데이터에 전체인구 대비 미성년 인구 백분율 변수를 추가하세요.(변수명=ratio_child)
#   (전체인구 - 성인인구)
# ------------------------  *  100
#        전체인구
# (poptotal-popadults)/poptotal*100

midwest <- midwest %>%
  mutate(ratio_child = (poptotal-popadults)/poptotal*100 )

midwest

# q2) 미성년 인구 백분율이 가장 높은 상위 5개 country(지역)의 미성년 인구 백분율을 출력하세요.
# 지역, 미성년인구백분율

midwest %>%
  select(county, ratio_child) %>%
  arrange(desc(ratio_child)) %>%
  head(5)


# q3) 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지 알아보세요.

#분류     기준
# large   40%
# middle  30~40% 미만
# small   30% 미만

midwest <- midwest %>%  
  mutate(grade = ifelse (ratio_child >= 40, 'large',
                         ifelse(ratio_child >= 30, 'middle', 'small')))

# 빈도수 확인
table(midwest$grade)

# q4) popasian은 해당 지역의 아시아인구를 나타냅니다. '전체인구대비 아시아인구백분율 변수를 추가하고 하위 10개지역 state(주), county(지역), 아시아 인구 백분율을 출력하세요

midwest <- midwest %>%
  mutate(ratio_asian = (popasian/poptotal) * 100) %>%
  arrange(desc(ratio_asian)) %>%
  select(state, county, ratio_asian) %>%
  head(10)

# 7.데이터 정제(빠진 데이터, 이상한 데이터 제거하기)
# 누락 된 값 = 결측치 = NA
# 이상한 데이터 = 이상치

# 수학점수 평균
# 80점대 

# 0점, 3점, 2점

# 결측치가 있으면 문제가 발생!
# : 함수가 적용되지 않음
# : 분석결과 왜곡

# 실제 데이터에 결측치가 있는지 확인 후 제거하는 정제과정을 거치고 분석을 들어가야 함

# 결측치가 만들어지는 원인
# 1. 실제 데이터에 값이 없는 경우 

df <- data.frame(sex = c('M', 'F', NA, 'M', 'F'),
                 score =c(5, 4, 3, 4, NA))
df

# 결측치 확인하기
# is.na() <- 결측치 확인 함수

is.na(df)

# 데이터가 많으면 표로 볼 수 없으므로 table 함수에 넣어서 보면 결측치 개수를 확인 할 수 있음
table(is.na(df))

# 특정 열 건만 결측치 확인
table(is.na(df$score))

# score가 NA인 데이터만 출력
df %>%
  filter(is.na(score))

# 데이터 결측치를 제거
# 기존데이터 - 결측치  - 결과

# 결측치를 제거하는 방법
df_nomiss <- df %>%
  filter(!is.na(score))

#결측치 제거 후 평균 산출됨
mean(df_nomiss$score)


# 여러변수에 결측치를 제거하는 방법
df_nomiss <- df %>%
  filter(!is.na(score) & !is.na(sex))

df_nomiss

# na.omit() : 결측치가 하나라도 있으면 제거
df_nomiss2 <- na.omit(df)

df_nomiss2

# na.omit() 문제점 : 예를 들어 성별, 소득, 지역 세 가지 변수로 구성된 데이터로 분석을 한다고 가정한다. 성별, 소득 두 변수의 결측치만 제고하고싶은 경우 na.omit()를 사용하면 성별, 소득뿐만아니라 지역 컬럼에 있는 결측치까지 모두 제거해 버린다. na.omit()은 모든 컬럼에 결측치가 하나만 있어도 그 행 자체를 제거해 버림, 즉 분석에 사용할 데이터까지 제거되는 경우가 있음. 번거럽더라도 fitler()를 이용해 분석에 사용할 변수의 결측치만 제거하는 방식을 권장함!!

# 함수의 결측치 제외 기능 이용하기
mean(df$score)
mean(df$score, na.rm = T) # 결측치 제외 후 평균 산출

# summrise() 결측치 제외 기능 이용하기 
exam <- read.csv('csv_exam.csv')
exam [c(3, 8, 15), 'math'] <- NA  #임의로 결측치 생성
exam

exam %>%
  summarise(mean_math = mean(math, na.rm=T))


# 다른 함수들도 결측지 제외 기능 사용가능
exam %>%
  summarise(mean_math = mean(math, na.rm=T),
            sum_math = sum(math, na.rm=T),
            median_math = median(math, na.rm=T))
exam

# 결측치 대체하기
# : 기존 : 결측치가 존재하면? <- 결측치 제거, 분석 실행
# 100건에 데이터가, 결측치가 2건
# 정상데이터 = 98건
# 100건에 데이터가, 결측치가 30건?
# 정상데이터 = 70건....

# ** 평균값으로 결측치 대체하기
mean(exam$math, na.rm=T) #1

exam$math <-  ifelse(is.na(exam$math), 55, exam$math) #2

table(is.na(exam$math)) #3

mean(exam$math)

# mpg 데이터에는 결측치 없은, 우선 mpg 데이터를 불러와서 몇 개의 값을 결측치로 만든다

mpg <- as.data.frame(ggplot2::mpg)

mpg[c(65, 124, 131, 153, 212), 'hwy'] < NA

# q1) drv 별로 hwy 평균이 어떻게 되는지 알아보려고 한다. 분석을 하기 전에 우성 두 변수에 결측치가 있는지 확인해야 한다. drv변수와 hwy변수에 결측치가 몇 개 있는지 알아보세요. (table(), is.na() 활용
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# q2) filter()을 이용해 hwy변수의 결측치를 제외하고, 어떤 구동방식의 hwy 평균이 높은지 알아보세요.
# (하나의 dplyr 구문으로 만들어보세요)
mpg %>%
  filter(!is.na(hwy)) %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

# 이상치
# : 정상 범주에서 크게 벗어난 값
# 1. 데이터 수집 시 오류로 인한 값 변경
# 2. 원래 극단적인 값

# 이상치 문제점
# 분석결과의 왜곡이 발생할 수 있음

# 이상치 해결하는 방법
# 1. 제거
# 2. 정제 후 수정

# 이상치 제거하기 - 존재할 수 없는 값
# 수학접수(0~100) / -> 123점  이상치
# 대학교 학점 / E학점
# 성별 / 중성

# 이상치 생성 1  = 정상치, 2 = 정상치치, 3 = 이상치
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))

outlier

table(outlier$sex)

# 이상치를 결측치로 변경
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex )
outlier


# score가 5보다 크면 NA 할당
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)

outlier

# 결측치 제거 후 성별에 다른 score 평균 구하기
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))

# 이상치 제거하기 - 극단적인 값

boxplot(mpg$hwy)

boxplot(mpg$hwy)$stats

# 12~37을 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)

table(is.na(mpg$hwy))

mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))

# 연습문제
mpg <- as.data.frame(ggplot2::mpg)

mpg[c(10, 14, 58, 93), 'drv'] <- 'k'
mpg[c(29, 43, 129, 203), 'cty'] <- c(3, 4, 39, 42)

# q1) drv에 이상치가 있는지 확인하세요. 이상치를 결측처리 한 후 이상치가 사라졌는지 확인하세요. 결측처리할 때는 $in% 기호를 활용하세요.

table(mpg$drv)

mpg$drv <- ifelse(mpg$drv %in% c('4', 'f', 'r'), mpg$drv, NA)

# q2) 상자 그림을 이용해 cty에 이상치가 있는지 확인, 상자그림의 통계치를 이용해 정상 범위를 벗어난 값을 결측 처리한 후 다시 상자그림을 만들어 이상치가 사라졌는지 확인하시오.

boxplot(mpg$cty) #1

mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty) #2

boxplot(mpg$cty) #3

# q3) 두 변수의 이상치를 결측 처리 했으니 이제 분석할 차례입니다. 이상치를 제외한 다음 drv별로 cty 평균이 어떻게 다른지 알아보세요. 하나의 dplyr구문으로 만드세요.

mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(mean_cty = mean(cty))


# 8단원 그래프 만들기
# ggplot2 패키기 <- 시각화 패키지

# 산점도 - 변수간 관계 표현하기
# : 데이터를 x축과 y축에 점으로 표현한 그래프를 산점도라고 한다. 산점도는 나이와 소득처럼 연속 값으로 된 두 변수의 관계를 표현할 때 사용

# ggploy2  레이어 구조 이해하기
# 총 3단계를 거쳐야함 
# 1단계: 배경설정(축)
# 2단계:  그래프 추가(점, 막대, 선)
# 3단계: 설정 추가(축 범위, 색, 표식)
library(ggplot2)

# 1단계
# x축은 displ, y축은 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))

# 2단계
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# 3단계
# x축 범위 3~6으로 조정 
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6)

# y축 범위 10~30으로 조정
ggplot(data = mpg, aes(x = displ, y = hwy)) 
+ geom_point() 
+ xlim(3,6) 
+ ylim(10, 30)


# gplot() vs ggplot()
# gplot은 기능이 많지은 않지만 문법이 간단하고 사용하기 쉬움, 데이터를 전처리 단계에서 빠르게 확인하고자 하는 용도로 많이 사용, 최종적으로 분석겨로가를 보고하기 위해 그래프를 만들 때는 ggplot()을 사용함, ggplot()을 사용하면 다양한 그래프를 만들 수 있고, 색 , 크기 , 폰트 등 세부 요소들을 자유롭게 조절 가능

# q1) mpg 데이터의 cty와 hwy와 간의 관계를 알아보고자 한다. x축은 cty, y축은 hwy 로 된 산점도를 만들어보세요.
ggplot(data = mpg, aes(x = cty, y = hwy)) + 
  geom_point() 


# q2) 미국 지역별 인구통계 정보를 담은 ggplot2 패키지의 midwest 데이터를 이용해 전체 인구와 아시아인 인구간에 어떤 관계가 있는지 알아보고자 한다. x축은 poptotal(전체인구), y축은 popasian(아시아인 인구)으로 된 산점도를 그려보세요. 전체 인구는 50만명 이하, 아시아인 인구는 1만명 이하인 지역만 산점도에 표기하게 설정하세요.

ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point() + xlim(0, 500000) + ylim(0, 10000)


# 막대 그래포 - 집단 간 차이 표현하기
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))
df_mpg

ggplot(data=df_mpg, aes(x=reorder(drv, -mean_hwy), y=mean_hwy)) + geom_col()

# 빈도 막대 그래프 
ggplot(data = mpg, aes(x=drv)) + geom_bar()


# x축에 연속 변수를 지정하면 값의 분포를 파악가능
ggplot(data = mpg, aes(x=hwy)) + geom_bar()

# geom_col() vs v geom_bar()
# 평균 막대 그래프는 데이터를 요약한 평균표를 먼저 만든 후 이 평균표를 이용해 그래프를 그린다. 반면 빈도 막대그래프는 별도로 만들지 않고 원자료를 이용해 바로 만든다. 요약표를 이용하는지 원자료를 이용하지에 따라 그래프를 만드는 절차와 함수가 다르다! 요약표는 geom_col(), 원자료를 geom_bar()를 사용한다.


# q1) 어떤 회사에서 생산한 suv 차종의 도시 연비가 높은지 알아보려고 한다. suv 차종을 대상으로 평군 cty가 가장 높은 회사 다섯 곳을 막대그래프로 표현해보자. 막대는 연비가 높은순으로 정렬

df <- mpg %>%
  filter(class  == 'suv')%>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty))
arrange(desc(mean_cty)) %>%
  head(5)


# q2) 자동차 중에서 어떤 class가  가장 많은지 알아보려고 한다. 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 보세요.
ggplot(data = df,  aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) + geom_col()


#선그래프

# : 시간에 따ㅣ라 달라지는 데이터를 표현할 때 주로 사용(시계열 데이터)
# ggplot2::economics 데이터 셋
# 미국의 경제지표를 월별로 나타낸 데이터 셋

library(ggplot2)

#unemploy: 실업자 수
ggplot(data = economics, aes( x=date, y = unemploy)) + geom_line()

#psavert(개인저축률) 시간에 따라 어떻게 변화하는지 알아보자
ggplot(data = economics, aes( x=date, y=psavert)) + geom_line()

# 상자 그림 - 집단 간 분포차이 표현하기
# : 데이터의 분포를 직사각형 상자모양으로 표현한 그래프
# 평균만 볼 때보다 데이터의 특징을 더 자세히 이해 가능

ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

# q1) class가 compact, subcompact, suv인 자동차의 cty가 어떻게 다른지 비교해보려고 한다. 세 차종의 cty를 나타낸 상자 그림을 그려보세요
library(dplyr)
mpg_class <- mpg %>%
            filter(class %in% c('compact', 'subcompact', 'suv'))

ggplot(data = mpg_class, aes(x=class, y= cty)) + geom_boxplot()

# 9단원 : 데이터 분석 프로젝트
# 1) 한국 복지패털데이터 준비하기
# : 한국보건사회연구원에서 가국의 경제활동을 연구해 정체지원에 반영할 목적으로 발간하는 조사자료, 전국에서 7000여 가구를 선정해 2006년부터 매년 추적조사한 자료로 경제활동 생활실태 복지욕구 등 천여개의 변수로 구성되어있다.

# 실습에 사용할 복지패널데이터는 통계분석 툴인 spss 전용파일
# foreign 패키지 : SPSS, SAS, STATA등 다양한 통계분석 소프웨어의 파일을 불러올 수 있음

install.packages('foreign')
library(foreign) # spss 파일 불러오기
library(dplyr) # 전처리
library(ggplot2) # 시각화
library(readxl) # 액셀파일 불러오기

# 데이터 불러오기
raw_welfare <- read.spss(file ='Koweps_hpc10_2015_beta1.sav', to.data.frame = T)

#복사본 만들기
welfare <- raw_welfare

head(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

welfare <- rename(welfare,
                  sex = h10_g3,                  #성별
                  birth = h10_g4,                #태어난 년도
                  marriage = h10_g10,            # 혼인상태
                  religion = h10_g11,            #종교
                  income = p1002_8aq1,           #월급
                  code_job = h10_eco9,           #직업코드
                  code_region = h10_reg7)        # 지역코드

# 성별에 따른 월급차이
class(welfare$sex)

# 이상치 없음
table(welfare$sex)

#이상치가 결측처리
welfare$sex <- ifelse(welfare$sex ==9, NA, welfare$sex)

#결측치 확인
table(is.na(welfare$sex))

# 성별항목 이름부여
welfare$sex <- ifelse(welfare$sex == 1, 'male', 'female')
table(welfare$sex)

#월급관련 변수
class(welfare$income)
summary(welfare$income)

qplot(welfare$income) + xlim(0, 1000)

#전처리
#이상치 결측처리

welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
table(is.na(welfare$income))


sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(data=sex_income, aes(x=sex, y=mean_income)) + geom_col()

#나이와 월급의 관계
class(welfare$birth)
summary(welfare$birth)

#전처리
# 1900~2014 외의 데이터는 결측처리
# 9999(무응답) 데이터는 ㄱ결측처리
table(is.na(welfare$birth))

# 파생변수 만들기
# 태어난 연도변수를 이용해 나이변수를 만든다
# 조사한 년도 : 2015
welfare$age <- 2015 - welfare$birth +1

summary(welfare$age)

age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

head(age_income)  

ggplot(data = age_income, aes(x=age, y=mean_income)) + geom_line()

welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, 'young', ifelse(age <= 59, 'middle', 'old')))
table(welfare$ageg)

ageg_incom <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

ggplot(data = ageg_incom, aes(x=age, y=mean_income)) + geom_col() + scale_x_discrete(limits = c('young', 'middle', 'old'))


# 연령대 및 성별 월급 차이
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(data = sex_income, aes(x=age, y=mean_income, fill=sex)) +
         geom_col() + scale_x_discrete(limits = c('young', 'middle', 'old'))

ggplot(data = sex_income, aes(x=age, y=mean_income, fill=sex)) +
  geom_col(position = 'dodge') + scale_x_discrete(limits = c('young', 'middle', 'old')) # 시험

#나이 및 성별 월급 차이 분석하기
sex_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))

head(sex_age)       
      
# col은 월급 평균선의 색상을 성별로 구분
ggplot(data = sex_age, aes(x=age, y=mean_income, col=sex)) + geom_line()

#직업별 월급 차이
class(welfare$code_job)

table(welfare$code_job)  

library(readxl)
list_job <- read_excel('Koweps_Codebook.xlsx', col_names = T, sheet =2)

head(list_job)

# 직업별 분석을 하고싶은데 현재 데이터셋에 직업은 직업코드만 입력되었기 때문에 직업코드별 해당직업의 이름열을 추가하여 분석에 용이하게 사용하기 위한 작업
welfare <- left_join(welfare, list_job, by='code_job')

welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)

# 직업별 월급 평균표
job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_income)

top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(40)
top10

View(top10)

ggplot(data = top10, aes(x = reorder(job, mean_income), y=mean_income)) +
  geom_col() +
  coord_flip() # 막대그래프를 90도 눕히기

#하위 10위 추출
bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(30)

ggplot(data = bottom10, aes(x = reorder(job, -mean_income), y=mean_income)) +
  geom_col() +
  coord_flip() +
  ylim(0,850)

# 성별 직업 빈도 - 성별로 어떤 직업이 가장 많을까
# 남성 직업빈도 상위 10개 추출
job_male <- welfare %>%
  filter(!is.na(job) & sex == 'male') %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(20)
job_male

job_female <- welfare %>%
  filter(!is.na(job) & sex == 'female') %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)
job_female

ggplot(data=job_male, aes(x=reorder(job,n), y=n)) + geom_col() + coord_flip()
ggplot(data=job_female, aes(x=reorder(job,n), y=n)) + geom_col() + coord_flip()

#종교에 유무에 따른 이혼률
# : 종교가 있는 사람들이 이혼을 덜할까?
class(welfare$religion)
table(welfare$religion)

#종교 유무 이름부여
welfare$religion <- ifelse(welfare$religion ==1, 'yes', 'no')
table(welfare$religion)



# 이혼 여부 변수 만들기
# 0 : 비해당 ( 미성년자)
# 1:  기혼
# 2: 사별
# 3: 이혼
# 4: 별거
# 5: 미혼(18세 이상, 미혼모 포함)
# 6:기타(사망)
welfare$group_marriage <- ifelse(welfare$marriage == 1,'marriage',
                                 ifelse(welfare$marriage == 3, 'divorce', NA))

table(welfare$group_marriage)
# 결측치 7521건은 분석대상에서 제외
# 9143건 (결혼, 이혼)

table(is.na(welfare$group_marriage))
religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage) %>%
  summarise(n =n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1)) #round 소숫점 첫째짜리

religion_marriage

divorce <- religion_marriage %>%
  filter(group_marriage == 'divorce') %>%
  select(religion, pct)

divorce

ggplot(data = divorce, aes(x=religion, y=pct)) + geom_col()

# 연령대 및 종교 유무에 따른 이혼율

ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != 'young') %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(pct = round(n/sum(n)*100, 1))

ageg_religion_marriage

#연령대 및 종교 유무별 이혼율 표 만들기
df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == 'divorce') %>%
  select(ageg, religion, pct)
df_divorce

ggplot(data = df_divorce, aes(x=ageg, y=pct, fill=religion)) + geom_col(position='dodge')

# 지역별 연령대 비율 - 노년층이 많은 지역은 어디일까?
class(welfare$code_region)
table(welfare$code_region)

# 지역 코드목록 만들기
list_region <- data.frame(code_region = c(1:7),
region = c('서울',
           '수도권(인천/경기)',
           '부산/경남/울산',
           '대구/경북',
           '대전/충남',
           '강원/충북',
           '광주/전남/전북/제주도'))
list_region

#지역명 변수 추가
welfare <- left_join(welfare, list_region, id='code_region')

welfare %>%
  select(code_region, region) %>%
  head()

# 지역별 연령대 비율표 만들기
region_ageg <- welfare %>%
  group_by(region, ageg) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 2))

head(region_ageg)

ggplot(data = region_ageg, aes( x = region, y = pct, fill = ageg)) +
  geom_col() + coord_flip() # 표를 통한 막대그래프 생성
  # 막대그래프 90도 눕힘
  
# 노년층 비율 내림차순 정렬
list_order_old <- region_ageg %>%
  filter(ageg == 'old') %>%
  arrange(pct)

list_order_old
# 지역명 순서 변수 만들기
order <- list_order_old$region
order

ggplot(data = region_ageg, aes(x=region, y=pct, fill=ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)

# 연령대순으로 막대 색깔 나열하기
# 그래프 옵션에서 변수의 범주(levels)
# ageg <- char Type으로 levels가 없음

class(region_ageg$ageg)
levels(region_ageg$ageg)

#levels를 가지려면 타입을 Factor 타입으로 변환해야 함
region_ageg$ageg <- factor(region_ageg$ageg,
                           level =c('old', 'middle','young'))
class(region_ageg$ageg)
levels(region_ageg$ageg)

ggplot(data = region_ageg, aes(x=region, y=pct, fill=ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)

View(welfare)
 
#10단원 텍스트 마이닝
# KoNLP(한글 자연어 분석 패키지)
# KoNLP 패키지는 의존성(rJava, memorise)

install.packages('rJava')
install.packages('memorise')
install.packages('KoNLP')

#r자바 패키지 로드에 문제가 있다
#Sys.setenv(JAVA_HOME = " jre경로)
library(KoNLP)
library(dplyr)

# 사전 설정하기
# : KoNLP에서 지원하는 NIA 사전은 90만여개으 ㅣ단어로 구성
# : 형태소 분석을 하는데 이 사전을 사용

#사전다운로드
useNIADic()

# 데이터 준비하기
txt = readLines('hiphop.txt')
head(txt)

#특수문자 제거
# : 문장에 이모티콘이나 특수문자가 포함되어 있으면 오류가 발생할 수 있음.
install.packages('stringr')
library(stringr)

# \\W = 특수문자를 의미하는 정규표현식
txt <- str_replace_all(txt, '\\W', ' ')

# 가장 많이 사용된 단어 알아보기
# 1. 명사 추출하기
# KoNLP의 extractNoun() 사용
# extractNoun()의 return은 list Type으로 반환
extractNoun('대한민국의 영토는 한반도와 그 부속도서로 한다')

# 가사에서 명사 추출
nouns <- extractNoun(txt)

#추출한 명사 리스트를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount<- table(unlist(nouns))

#데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

library(dplyr)
# 변수명 수정
df_word <- rename(df_word, word = Var1, freq = Freq)

# 두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)

  View(df_word)
class(df_word)
top_20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)
top_20

# 워드클라우드 만들기
install.packages('wordcloud')
library(wordcloud)
library(RColorBrewer)

#단어 색상 목록 만들기
# dark2 색상 목록에서 8개 색상 추출
pal <- brewer.pal(8, 'Dark2')

#난수 고정하기
