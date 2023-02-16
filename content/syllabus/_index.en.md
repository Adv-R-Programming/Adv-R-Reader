---
pre: <b>1. </b>
title: Syllabus
weight: 1
format:
  hugo:
    toc: true
    output-file: "_index.en.md"
    reference-links: true
    code-link: true
---

<script src="syllabus_files/libs/kePrint-0.0.1/kePrint.js"></script>
<link href="syllabus_files/libs/lightable-0.0.1/lightable.css" rel="stylesheet" />


-   [Course Description]
-   [Course Structure]
-   [Course Instructor]
    -   [Contacting Me]
-   [Course Policies]
    -   [Required Materials]
    -   [Attendance]
    -   [Academic Honesty]
    -   [Code of Conduct]
    -   [Accommodation]
-   [Grading]
    -   [Standards-Based Grading]
    -   [Standards]
    -   [Final Grades]
    -   [Late Work Policy]
-   [FAQ]

## Course Description

The primary aim of Advanced Programming for Data Science (SDS 270) is to teach how to use R to do things. The course will build programming competencies, culminating in students creating their own code packages for R in a group. We will start by creating single functions, learning to debug them, then incrementally add more elements of the programming life cycle such as project management, automatic code testing, and building proper documentation. Supplemental skills useful for advanced programming such as using remote servers, as well as various methods for creating your own data sets will be explored in support of creating the final R packages.

## Course Structure

Each week follows the same basic structure. Monday and Wednesday classes include lectures to introduce new concepts. Each lecture is followed by interactive problem sets designed to reinforce concepts through active learning. Slides from lecture will be posted online after class. The problem sets for any class are "due" at the start of the next class period when the answers will be released; most problem sets can be completed in class. In-class problem sets do not contribute toward your grade. They are intended to reinforce material and help you test your own understanding.

Friday classes are devoted to lab activities or project work time. Students are expected to come to class for these activities. Labs include more involved problem sets that incorporate topics from the current and prior weeks. Students work on labs in groups of two to four people. Labs are reviewed through GitHub Classroom where feedback is provided.

For a full list of assignments and due dates, please see the course [schedule].

{{% notice info %}}
This is a 4-credit course. You should be spending 12-hours total per week on this course. Expect to spend around 8.25 hours (12 hours - 3.75 hours/week of in-class instruction) on class material per week outside of class.
{{% /notice %}}

## Course Instructor

![][1]

I am a sociologist that studies abuses of power in government. I earned my Ph.D. at the University of California, Davis in in sociology with a designated emphasis in computational social science. I combine computational methods such as social network analysis, natural language processing, geospatial analysis, and machine learning with open source and governmental data to uncover patterns of malfeasance and misfeasance by our public servants. From the political networks of politicians and prohibition gangsters to bias hidden in the text of academic recruitment, I use new methods to work on old problems of corruption and inequality.

I am a visiting assistant professor in the Statistical & Data Sciences (SDS) program. I have experience working with both United States and United Kingdom governmental organizations applying machine learning to real-world problems. In the UK, I worked with the national lab for data science and machine learning, the Alan Turing Institute, on early-detection systems in foster care to assure children are receiving adequate services. Meanwhile in the US I worked with the Internal Revenue Service to build a machine learning system that determined the credibility of incoming fraud reports.

### Contacting Me

{{< tabs >}}

{{% tab name="Slack" %}}

You can send me a message on the course <a href="https://sds-270-01-202303.slack.com/">Slack workspace</a>, and I will respond when I am able, typically within 24 hours *during the work week*. To message me, click the **+** button next to "Direct Messages" and search for my name.

If your question is not sensitive in nature, consider putting it in the `#coding-help` or `#course-help` channel instead. There is a good chance one of your classmates will be able to answer before I can.

Slack questions should be brief or administrative in nature. For more in-depth questions and troubleshooting please attend office hours.

{{% /tab %}}
{{% tab name="Office Hours" %}}

You can schedule a meeting with me on <a href="https://calendly.com/jared-joseph/office-hours">Calendly</a>. Drop-ins are welcome, but priority is given to those who make an appointment. Group appointments, to address a similar question, are welcome.

If you are coming to office hours with a coding question, make sure you have the code ready *at the start of your appointment*. Have your computer booted up and your project open.

If you cannot find an open time slot, please message me for an appointment. I will attempt to find a time that works for both of us.

{{% /tab %}}

{{< /tabs >}}

## Course Policies

### Required Materials

Students are not expected to buy any materials for this course. Data science is built on free and open collaboration. There is no shortage of high-quality learning material available. This reader, as well as all assignments, are currently available for free.

Students are required to have a working computer (preferably a laptop) and reliable internet connection for this course. Any recent computer should be sufficient, with the notable exception of Chromebooks. Chromebooks lack access to the majority of the tools used by data scientists.

{{% notice warning %}}
If you only have access to a Chromebook, please speak with me as soon as possible.
{{% /notice %}}

### Attendance

I will not be taking attendance in this course, and you do not need to inform me when you will be absent. **If you are sick, please stay home.** Given the standards-based grading system (discussed below), no single class, assignment, or even quiz will negatively impact your grade. That said, it will be very difficult to keep up with course material without consistent attendance.

If you miss a class, you should contact a peer to discuss what was missed, and check the course reader website for any upcoming deadlines. I won't have the capacity to re-deliver missed material in office hours.

{{% notice info %}}
Quizzes cannot be made up after the open period has passed. If you have a known scheduling conflict with a quiz, please speak with me as soon as possible to arrange an alternative time.
{{% /notice %}}

Please see the SDS department's official policy regarding remote learning:

> In keeping with Smith's core identity and mission as an in-person, residential college, the Program in Statistical & Data Sciences affirms College policy (as articulated by Provost Michael Thurston and Dean of the College Alex Keller) that students will attend class in person. As such, SDS courses will not provide options for remote attendance. Students who have been determined to require a remote attendance accommodation by the Office of Disability Services will be the only exceptions to this policy. As with any other kind of accommodations under the Americans with Disabilities Act (ADA), please notify your instructor during the first week of classes to schedule a meeting with them to discuss how we can work with you to provide the most accessible course possible.

### Academic Honesty

Data science is inherently collaborative, so I fully expect students to collaborate. You are encouraged to work together on most assignments---ask questions on Slack, create study groups, and share helpful resources you find. However, anything you submit must be your own work. You need to be the person who writes the text and/or code. Multiple students should not submit identical work. **Please note: The only avenue in which collaboration is not allowed is on quizzes.**

All students, staff, and faculty are bound by the Smith College Honor Code:

> Students and faculty at Smith are part of an academic community defined by its commitment to scholarship, which depends on scrupulous and attentive acknowledgement of all sources of information and honest and respectful use of college resources.<br><br>Smith College expects all students to be honest and committed to the principles of academic and intellectual integrity in their preparation and submission of course work and examinations. All submitted work of any kind must be the original work of the student who must cite all the sources used in its preparation.<br><br>
> <p style="text-align: right">
> -Smith Academic Honor Code
> </p>

Any cases of dishonesty or plagiarism will be reported to the Academic Honor Board. Examples of dishonesty or plagiarism include:

-   Submitting work completed by another student as your own.
-   Copying and pasting text *or code* from sources without quoting and citing the author.
-   Paraphrasing material from another source without citing the author.
-   Failing to cite your sources correctly.
-   Falsifying or misrepresenting information in submitted work.
-   Having another student or service complete assignments for you.

Learning to code is similar to learning a new language; *you will only learn by doing*. No amount of rote copying will advance you beyond the most elementary levels of understanding. Please keep this in mind.

If someone else helps you understand a concept better, give them a nod in the `#shoutouts` channel on Slack.

### Code of Conduct

> As participants in this course we are committed to making participation a harassment-free experience for everyone, regardless of level of experience, gender, gender identity and expression, sexual orientation, disability, personal appearance, body size, race, ethnicity, age, or religion. Examples of unacceptable behavior by participants in this course include the use of sexual language or imagery, derogatory comments or personal attacks, trolling, public or private harassment, insults, or other unprofessional conduct.<br><br> As the instructor I have the right and responsibility to point out and stop behavior that is not aligned with this Code of Conduct. Participants who do not follow the Code of Conduct may be reprimanded for such behavior. Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting the instructor.<br><br>All students and the instructor are expected to adhere to this Code of Conduct in all settings for this course: seminars, office hours, and over Slack.

This Code of Conduct is adapted from the [Contributor Covenant].

### Accommodation

Smith College is committed to providing support services and reasonable accommodations to all students with disabilities. To request an accommodation, please register with the [Office of Disability Services (ODS)] at the beginning of the semester.

## Grading

### Standards-Based Grading

This course will be graded using a standards-based grading system. Rather than tallying up the percentage of questions you answer correctly, I assess your responses by using a pre-defined set of course standards and then assign a level of proficiency. Throughout the semester, this course offers multiple opportunities to showcase the depth of your understanding in light of these standards.

In traditional points-style grading, an average is taken of all your assignments, and your final grade is based on that average. This means all assignments are given equal consideration in your final grade.

![][2]

In contrast, standards-based grading is focused on your progression through the course. Functionally, only your best score for each standard is kept. All others are effectively forgotten. The hope is that without the worry of "getting a bad grade" when you are new to a concept, you will feel free to safely engage with complicated topics early on, make mistakes, and have opportunities to show improvement without penalization.

![][3]

A standards-based grading system carries a number of other benefits:

-   Learning targets for the course are clearly defined from the outset. Every graded assignment is directly tied to at least one standard. There is no "busy work" with a standards-based system.
-   No single assignment will make-or-break your grade. You have multiple opportunities to demonstrate fluency in a standard. This rewards students that take the time to practice and learn from their mistakes. It prioritizes student growth throughout the course of the semester.
-   Assessments in a standards-based system are much clearer than in a point-based grading system. Saying that I've become proficient in doing X, Y, or Z means more than saying that I earned a 92.5 in my course.
-   A standards-based grading system makes it easier to monitor your own progress towards a certain grade.
-   There is no competition and no curve in a standards-based system. The only person you are ever compared with is your past self. Help each other often and freely.

### Standards

The following table lists all the standards you are evaluated on in this course. There are 8 total standards, separated into 5 categories. Each standard states what conditions must be met to reach each proficiency level. There are four proficiency levels for each standard, each requiring more complete understanding of the material. **These levels are inclusive, meaning to reach "Exceeds Standard" you must also meet all the requirements of "Meets Standard" and below.**

You will have multiple opportunities to demonstrate your understanding of each standard. Any assignment that is reviewed is an opportunity to increase your proficiency level in a standard. In addition to the levels of proficiency, there is also an extra point available in each standard called "Individual Standard." You may fulfill this requirement only on quizzes, but only need to reach the "Meets Standard" criteria on a standard to do so.

{{% notice info %}}
You can demonstrate proficiency in any reviewed assignment, **but can only fulfill the "Individual Standard" criteria on a quiz.**
{{% /notice %}}

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Standard </th>
   <th style="text-align:left;"> Does Not Meet Standard </th>
   <th style="text-align:left;"> Progressing Toward Standard </th>
   <th style="text-align:left;"> Near Standard </th>
   <th style="text-align:left;"> Meets Standard </th>
   <th style="text-align:left;"> Exceeds Standard </th>
   <th style="text-align:left;"> Individual Standard </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #FBB4AE !important;border-right:1px solid;"> Functions </td>
   <td style="text-align:left;"> Copies-and-pastes similar code with small changes. </td>
   <td style="text-align:left;"> Creates simple functions with predetermined inputs. </td>
   <td style="text-align:left;"> Creates functions that that make use of arguments to modify their output. </td>
   <td style="text-align:left;"> Creates functions that can handle novel inputs, with logic and error checking to determine outputs. </td>
   <td style="text-align:left;border-right:1px solid;"> Creates functions that can handle arbitrary input through the use of ". . ." or S3 classes. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #FBB4AE !important;border-right:1px solid;"> Iteration </td>
   <td style="text-align:left;"> Copies-and-pastes similar code several times to repeat identical tasks on different data. </td>
   <td style="text-align:left;"> Calls an identical function (even self-made) to repeat a task on different data. </td>
   <td style="text-align:left;"> Uses loop style iteration to act on sequences of data. </td>
   <td style="text-align:left;"> Uses apply style iteration to act on sequences of data. </td>
   <td style="text-align:left;border-right:1px solid;"> Can iterate in parallel and justify the overhead costs. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #FBB4AE !important;border-right:1px solid;"> Data Structures </td>
   <td style="text-align:left;"> Cannot differentiate between data types (numeric, logical, character, etc.). Uses the wrong type during analyses. </td>
   <td style="text-align:left;"> Can subset data from vectors or dataframes by position or condition. </td>
   <td style="text-align:left;"> Works with lists when appropriate and can subset list elements effectively by position or condition. </td>
   <td style="text-align:left;"> Works with attributes effectively. Can modify and use attributes to manipulate or create data structures. </td>
   <td style="text-align:left;border-right:1px solid;"> Works with lists by inputting and sub-setting programmatically defined arbitrary elements. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #CCEBC5 !important;border-right:1px solid;"> Code Style </td>
   <td style="text-align:left;"> Code style is inconsistent and lacks appropriate comments. </td>
   <td style="text-align:left;"> Code comments explain the general purpose of the code file. Indentation is consistent and predictable. </td>
   <td style="text-align:left;"> Code comments explain the broad strokes of intended behavior per section. Files make use of the built-in section headings in R Studio. </td>
   <td style="text-align:left;"> Comments explain code step-by-step. All dependencies and parameters are clearly provided and explained at the top of code files. </td>
   <td style="text-align:left;border-right:1px solid;"> Code includes built in error checking for anticipated problems. These checks will output warnings or stop execution of code. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #CCEBC5 !important;border-right:1px solid;"> git/Github </td>
   <td style="text-align:left;"> Does not use git for version control. </td>
   <td style="text-align:left;"> Uses git for version control on individual projects with appropriately sized commits with descriptive commit messages. </td>
   <td style="text-align:left;"> Uses git and GitHub for version control on group work with appropriately sized commits with descriptive commit messages. </td>
   <td style="text-align:left;"> Effectively creates and merges branches of appropriate size. No sensitive files are committed. </td>
   <td style="text-align:left;border-right:1px solid;"> Effectively requests and performs code review on pull requests using GitHub. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #CCEBC5 !important;border-right:1px solid;"> Project Management </td>
   <td style="text-align:left;"> Does not use project management tools. </td>
   <td style="text-align:left;"> Project management is only conducted though messaging, such as on slack. </td>
   <td style="text-align:left;"> User the GitHub issue tracker to set milestones, but does not fill out associated metadata such as who is responsible for the issue and when it is due. </td>
   <td style="text-align:left;"> Uses the GitHub issue tracker to break down and assign actionable work with all appropriate metadata included. </td>
   <td style="text-align:left;border-right:1px solid;"> Uses projects KanBan boards to break down tasks into actionable steps, and track their completion. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #B3CDE3 !important;border-right:1px solid;"> Package Function </td>
   <td style="text-align:left;"> Package cannot be installed. </td>
   <td style="text-align:left;"> Package does not pass check(). </td>
   <td style="text-align:left;"> One or more component functions or unit tests of package do not execute. </td>
   <td style="text-align:left;"> Package includes and passes all unit tests to ensure expected functionality. </td>
   <td style="text-align:left;border-right:1px solid;"> Package passes check() with no warnings. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #B3CDE3 !important;border-right:1px solid;"> Package Documentation </td>
   <td style="text-align:left;"> Package has no documentation. </td>
   <td style="text-align:left;"> Team can create a ReadMe file which explains the overall purpose of the package and its use. </td>
   <td style="text-align:left;"> Package includes help files for all functions, including a definition, expected inputs, outputs, and clear descriptions of arguments. </td>
   <td style="text-align:left;"> Vignettes are provided for the major functionalities of the package. Help files include reproducible examples of function usage. </td>
   <td style="text-align:left;border-right:1px solid;"> A live website is accessible for the package to share resources and vignettes. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
</tbody>
</table>

### Final Grades

Your completion of these standards are converted into a final letter grade using the following process. Each of the 8 standards will be converted into a five-point scale, with one point available for meeting the "Individual Standard" on a quiz.

-   1 Point. "Does Not Meet Standard"
-   2 Points. "Progressing Toward Standard"
-   3 Points. "Near Standard"
-   4 Points. "Meets Standard"
-   5 Points. "Exceeds Standard"
-   +1 Point. "Individual Standard"

On this scale, there are 48 points total in the course (8 standards \* 6 possible points). I sum the highest level of proficiency you reach in each standard over the course of the semester to arrive at your final score. For example, if someone were to reach "Exceeds Standard" in all standards, but could never do so on a quiz, they would receive 40 of 48 points (5 points \* 8 standards). Similarly, if someone reaches "Meets Standard" in all topics, including on quizzes, but did not reach "Exceeds Standard" in any topic, they would likewise receive 40 of 48 points.

The summed points will be converted into letter grades using the following table.

| Letter | Points         |
|--------|----------------|
| A      | 45, 46, 47, 48 |
| A-     | 43, 44         |
| B+     | 41, 42         |
| B      | 39, 40         |
| B-     | 37, 38         |
| C+     | 35, 36         |
| C      | 33, 34         |
| C-     | 31, 32         |
| D+     | 29, 30         |
| D      | 27, 28         |
| D-     | 25, 26         |
| F      | 0 - 24         |

### Late Work Policy

Assignments turned in late will not be reviewed, and will not be considered for demonstrating proficiency in course standards. Keep in mind, missing an assignment will not hurt your grade, but does remove one chance for you to demonstrate your knowledge of course material. If you do not think you will be able to turn in an assignment by the deadline, you may request an extension. To do so, please send me a message explaining why you are unable to complete the assignment in the expected time frame. **Extension requests must be made--and accepted--before the assignment due date.**

{{% notice info %}}
After the due date, late assignments are only reviewed if there are *emergency* circumstances preventing you from turning the assignment in on time.
{{% /notice %}}

## FAQ

Q: So if I reach "Exceeds Standard" and fulfill the individual standard on a quiz for a topic early in the semester, I can just skip those questions for the rest of the class?

A: Theoretically yes, but I would recommend you answer all questions to make sure you're not letting your knowledge slip.

  [Course Description]: #course-description
  [Course Structure]: #course-structure
  [Course Instructor]: #course-instructor
  [Contacting Me]: #contacting-me
  [Course Policies]: #course-policies
  [Required Materials]: #required-materials
  [Attendance]: #attendance
  [Academic Honesty]: #academic-honesty
  [Code of Conduct]: #code-of-conduct
  [Accommodation]: #accommodation
  [Grading]: #grading
  [Standards-Based Grading]: #standards-based-grading
  [Standards]: #standards
  [Final Grades]: #final-grades
  [Late Work Policy]: #late-work-policy
  [FAQ]: #faq
  [schedule]: /Adv-R-Reader/#schedule
  [1]: https://filedn.com/l7C36orhaIP0u9d6RtOoEES/jnjoseph_headshot_live.jpg?classes=floatright,inline,headshot&featherlight=false "Dr. Jared Joseph"
  [Contributor Covenant]: https://www.contributor-covenant.org/version/1/0/0/code-of-conduct/
  [Office of Disability Services (ODS)]: https://www.smith.edu/about-smith/disability-services
  [2]: points_total.png
  [3]: standards_total.png
