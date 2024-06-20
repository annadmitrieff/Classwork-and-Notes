
# June 19th, 2024 -- Notes
## CURO Summer Fellowship Midterm Report
I completed and submitted my Midterm Report for my CURO Fellowship (see below).

***

## Completed Itinerary/Currently-Running Initiatives
### 1. Software
- I installed GINGA and SAOImageDS9, writing detailed documentation (for macOS) of any issues I encountered and remedied.
- I used GINGA and SAOImageDS9 to experimentally evaluate generic smartphone photos of the Orion and Taurus constellations to determine a reasonable evaluation process for photographed stars: 
This process includes using SAOImageDS9 for contour maps around selected bright spots/stars by using Analysis > Contours.
  - This process includes using SAOImageDS9 for brightness curves using the brightness profile feature (in SAOImage, select Shape > Projection from the Region dropdown menu and drag a cross-section line over the star you seek to evaluate, focusing on creating an even gradient across all zones of the contour as well as the approximate center).
  - This process also includes using GINGA for more precise measurements that don't rely on hand-drawn brightness profile paths with a Python script that Dr. Song provided for me that I later modified for efficacy and functionality with GINGA's relevant libraries. The Python script provides brightness profiles of stars at user-input coordinates in an image, producing output curves such as the following (the image here is of Vega in Orion):

![Image](https://github.com/STEMin3D/Low-Cost-Telescopes/blob/main/Notebook/Images/1244%2C1529.png)

- I used Astrometry.net to profile the constellations in my photographs that I couldn't easily identify by eye. This may prove useful for students taking long-exposure photographs with smartphones who don't necessarily have automated mounts that can track and focus on specific constellations for an extended duration of time. 
- I used SkyView (a paid smartphone app) to track constellations with moderate accuracy. I intended for a majority of my photos to focus on the star R Lyr, though I had varying degrees of success. Granted, much of the time I was stabilizing my smartphone by hand instead of by using a mount and a timed exposure shot, so this error could, and likely is attributed to my attempts at aiming the camera.

### 2. Photography
- I worked with my Celestron Firstscope to attempt astrophotography in some of the darkest locations in the United States--Big Bend National Park, Joshua Tree National Park, and Death Valley National Park. Most of the photos I ended up taking were purely using my smartphone camera, for reasons further elaborated on below. 

![nomap](https://github.com/STEMin3D/Low-Cost-Telescopes/blob/main/Notebook/Images/Dark%20Site%20Photos/052724_11-04-58.jpeg)
![map](https://github.com/STEMin3D/Low-Cost-Telescopes/blob/main/Notebook/Images/Dark%20Site%20Photos/052724_11-04-58_MAP.jpeg) 

- Unfortunately, due to the camera configuration of the smartphone I used on this trip, I was unable to capture any photos using the telescope because my phone's field of view was limited by the small optical hole of the eyepiece.
  - Others with the same telescope and smaller smartphone cameras have had more success with photographing the moon and the Orion Nebula, so it's certainly possible.
  - To remedy my issue and to make astrophotography with this telescope more accessible for a general student body that may be using this telescope in the future, I've considered a few wide-angle lenses with larger optical holes to accommodate multi-camera setups on smartphones (e.g. 1, 2, 3).
  - I've additionally considered purchasing a smartphone tripod to provide more stable long-exposure photographs using purely a smartphone. This would also enable more accurate camera positioning for tracking constellations across the night sky at various time periods. I've had poor luck finding an alt-az smartphone tripod, though, and am currently considering a 3D-printed option instead (which I need to figure out how to construct digitally, first). 
  - Another purchase that may be helpful for using this telescope (though not essential) could be an adjustable laptop projector stand that can serve as a rotatable surface to rest the telescope on; the Celestron FirstScope is a tabletop telescope and thus is not compatible with a traditional mount--it acts as a Dobsonian scope, but doesn't have the traditional height of a Dobsonian that makes viewing easier even when resting on the ground.
- While on the West Coast and in California, I learned about a high school accessibility initiative internship that the NASA AMes Research Center has for students in the Bay Area. 
  - Taking inspiration from that accessibility initiative internship, it may be interesting to consider a similar involvement event where high school students can work with undergraduates in the physics education department to acquaint themselves with more qualitative research practices, enabling them to learn the methods, tools, equipment, and software they may need for more technical and quantitative pursuits later in their prospective careers.
  - This may be a great way to boost student recruitment and engagement with the physics department.

### 3. Labs & Content
- Although I still need to complete more standardized and linear photography trials, I've begun to write labs referencing outdoor ASTR1110L/1120L/3010L labs provided to me by Dr. Magnani, based on astrophotography using the FirstScope telescope and the software I've been using to analyze my resultant images taken from a smartphone camera.
  - These prospective labs, when finalized, will have in-person/in-classroom and take-home components, with these components optimized to provide students with the help they may need when troubleshooting software installation as well as the guidance they may require to understand the methodology they'll need to analyze their own photos at home. 
  - In more detail, I'm considering focusing in-person/in-classroom lab components on software installation and example data analysis using a standard and universal set of sample images that students can practice creating brightness curves for and analyzing using SAOImage and GINGA. 
  - Students should ideally practice setting up and using a telescope with a smartphone mount and their smartphone, as well as using related software or applications (Astrometry.net, SkyView) to ensure that they're at least familiar with the basics of setting up their equipment at home.
  - As a result, take home components will mainly be iterations of the telescope/smartphone set-up process and image analysis process that students will already be acquainted with, with the distinction being that students will be using their own photos as data.
To ensure academic honesty, uniqueness of students' photos can be evaluated with image searching utilities such as TinEye.

### 4. Additional & Tangential Work
- As a personal project, I've been familiarizing myself with SPH code and astrophyiscal simulation software including PHANTOM SPH and Swift SPH. I additionally considered learning Starsmasher as well, but that requires a Linux OS and an NVIDIA GPU (which I have access to, but my PC is currently in storage for the summer). I've produced a few simulations using both PHANTOM and Swift respectively:

https://github.com/STEMin3D/Low-Cost-Telescopes/assets/142821835/66673e45-22b4-4c69-a62b-51125ac9baf8

- I've considered using the UGA supercomputer Sapelo2 to continue experimenting with this software, but would need access and approval through a PI/lab/advisor.
- I've been working with this software as well as familiarizing myself with SPH, accretion disc, and exoplanet literature with the hopes of working with Dr. Cassandra Hall later in my undergraduate career, and possibly even next semester.
- I reached out to her (Dr. Hall) at the beginning and end of last semester and have been in contact with her over the summer, working through the reading list she usually gives her PhD students. We plan on meeting at the beginning of next semester to talk, tentatively regarding a potential project on exoplanet migration. As a result I've been completing a literature review on the topic as well as in the overall field and would love to have something to connect my current accessibility/education project with this prospective project with the hopes of making simulations astrophysics research more accessible to UGA undergraduates due to the limited opportunities available on-campus.

## Running Itinerary

- Formalize a methodology to gauge apparent luminosity variances in photos taken with a smartphone and with the Celestron Firstscope over staggered or uneven time intervals without having a full period of a variable star photographed or recorded with the same photographic tools (smartphone and/or telescope).
- Evaluate the efficacy and maximum observational capacities of the smartphone and telescope using specifications given from the telescope manufacturer (e.g. the limiting stellar magnitude of the FirstScope is 11.9 and the light-gathering power compared to a human eye is 118x as per the FirstScope Wiki).
  - Does the apparent/photographed luminosity range flat-top or inaccurately represent the peaks and lows of the apparent luminosity of the star? How does it compare to the formal documentation of the star's apparent and true luminosity range? 
- Purchase eyepieces with larger FOVs that are compatible with the telescope, purchase a smartphone tripod mount or 3D print one (or tentatively plan to do so when I have access to a 3D printer).
- Categorize which stars are visible from a Bortle 4 (Watkinsville/Iron Horse) to Bortle 8 (Inner Athens/On-Campus)-class sky.
- Finalize example labs and begin drafting surveys for evaluating the efficacy of telescopes and the effectiveness of labs in preparation for distribution during the fall semester.

## Overall Summer Agenda
- Draft (and potentially finalize, at least for MacOS) documentation for software such as SAOImage DS9 and GINGA (as well as more advanced simulational software such as PHANTOM that may not be specifically relevant to this project) for students that may be unfamiliar with coding, UNIX/Linux systems, and using command line operations and their terminal for basic navigation, software utilization, and code execution.
- Finalize equipment list and add-ons for the Celestron FirstScope.
- Re-conduct astrophotography trials with smartphone in a Bortle class that more closely resembles the light level in Athens.
  - There may not be enough time left in the summer to acquire necessary equipment and re-evaluate the telescope's photography capacity to produce results by the final forum. As a consequence, I'm planning on conducting these trials purely with a smartphone, which may be a good facet of this study to consider overall if students' equipment is really limited (i.e. no telescope). 
- Formalize and finalize labs, formalize and finalize surveys and consider incentives for surveys.
- Distribute surveys amongst UGA student population (and, potentially a high school student population for the purpose of evaluating outreach components) in order to evaluate the software and telescope setup process, lab difficulty and efficacy, and how to overall improve the curriculum.
  - High schools to consider may include local Athens/Clarke County high schools, underfunded and underprivileged student populations, high schools with astronomy curriculum (e.g. in the Fulton County area--I know that at least Johns Creek High School does), high schools with astronomy clubs (e.g. Fulton Science Academy has an astronomy and astrophotography club as well as a Small Satellite Lab, both of which I founded and have willing student populations).
  - I may not have enough time for the survey process during the summer specifically due to the low student population on-campus and in high schools, as well as because generating survey responses may take time.
  - As a consequence, I'm considering implementing the surveys during the fall where students may even include the lab curriculum in an actual astronomy lab under the guidance of a professor I may collaborate with.

## Long-Term Goals
- Re-evaluate the Celestron FirstScope with better focal pieces and lenses using standardized time increments and more accurate sky tracking, as well as photographs more focused on a specific variable star.
- Finalize survey results and compile findings into a research paper (I'd like to publish something formal in addition to presenting a poster at the Final Forum).
- Even after the completion of this low-cost telescope project, I hope to integrate an ongoing vein of accessibility and outreach throughout my research in the future (prospectively with Dr/ Hall) through providing more thorough and straightforward documentation for software, guidance with Fortran for beginners, and a more guided and less technical breakdown of the standard methods used in simulations astrophysics.
- Collaboration with the Astronomy Club, the Astronomical Student Society, and the Dark Sky Conservation Club & Project to host more outreach events and public viewing nights.
  - An idealistic goal I hope to accomplish or at least push to accomplish at some point is to repair the observatory.
  - Motivations for this include hosting public viewing nights that may draw more students to the physics and astronomy department, potentially boosting student recruitment and overall attention to the Physics & Astronomy department.
- Consider self-assembly telescopes.
  - This component of the project has been on the backburner for me as I don't feel sufficiently knowledgable about how to build my own telescope, so constructing an entire kit that is both simple, accessible, and 3D-printable is a bit beyond my skillset at this time.
I'm still in the process of familiarizing myself with the field, though, so I may continue this aspect of the project in the fall semester. 
