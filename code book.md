variable list:
  1. "activity.table":       data read in from  "./UCI HAR Dataset/activity_labels.txt".
  2. "feature.table":        data read in from  "./UCI HAR Dataset/features.txt".
  3. "test.subject":         data read in from "./UCI HAR Dataset/test/subject_test.txt".
  4. "test.x":               data read in from "./UCI HAR Dataset/test/X_test.txt".
  5. "test.y":               data read in from "./UCI HAR Dataset/test/y_test.txt".
  6. "train.x":              data read in from "./UCI HAR Dataset/train/X_train.txt".
  7. "train.y":              data read in from "./UCI HAR Dataset/train/y_train.txt".
  8. "train.subject":        data read in from "./UCI HAR Dataset/train/subject_train.txt".
  9. "descr.act.test":       data achieved by subseting from "data.frame(activity.table[test.y[,1],2])"
  10. "descr.act.train":     data achieved by subseting from "data.frame(activity.table[train.y[,1],2])"
  11. "samsung.data"         data that combines "test.data" and "train.data" by rbind().
  12. "samsung.data.melted"  data formed by melting "samsung.data" with "subject", "ActivityName", "ActivityID" as "id.vars".
  13. "samsung.data.tidy     data formed by cast "samsung.data.melted" with mean value of "subject + ActivityName ~ variable".  
