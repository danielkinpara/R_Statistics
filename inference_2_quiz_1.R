# Need to place the txt file in the same folder of the code

babies = read.table("babies.txt", header=TRUE)
bwt.nonsmoke = babies$bwt[babies$smoke==0]
bwt.smoke = babies$bwt[babies$smoke==1]

n <- 1000
N <- 30

ic <- replicate(n, {
        bns <- sample(bwt.nonsmoke, N)
        bs <- sample(bwt.smoke, N)
        t.test(bns, bs)$conf.int
})

media <- mean(ic[2, ] - ic[1, ])

popdiff = mean(bwt.nonsmoke) - mean(bwt.smoke)

dentro <- ic[1, ] < popdiff & ic[2, ] > popdiff
prop <- (1000 - sum(dentro))/1000
