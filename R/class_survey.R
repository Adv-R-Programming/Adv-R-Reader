# to create class survey data

survey = googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1Je61j4NNAtyOGJaJzbcMpnGiglCsRRi9FF1qE_cKmaE")

# rename columns
colnames(survey) = c("timestamp", "email", "fav_char", "major", "fav_color", "fav_num", "other_classes", "b_month", "car", "pineapple_pizza", "mint_choc", "nerd", "hours_sleep", "pets", "fav_art", "coffee_days", "tea_days", "soda/pop_days", "juice_days", "none_days", "lt_location", "fict", "recreation", "hotdog", "top5")

# drop needless
survey = survey[, -c(1,2,7)]

# give unique keys
survey$key = paste0(survey$fav_char, "_", row.names(survey))

# turn yes/no into logical
survey[survey == "Yes"] = "TRUE"
survey[survey == "No"] = "FALSE"

survey$car = as.logical(survey$car)
survey$pineapple_pizza = as.logical(survey$pineapple_pizza)
survey$nerd = as.logical(survey$nerd)
survey$hotdog = as.logical(survey$hotdog)

# save

saveRDS(survey, "./class_survey.rds")
