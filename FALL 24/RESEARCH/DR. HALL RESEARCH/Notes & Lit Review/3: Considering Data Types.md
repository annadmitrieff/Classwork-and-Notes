Although the sample program I've written accepts data in the `.jpeg` file format, astronomical data from Chandra & Webb may offer more detail in alternative formats.

## What Data Does JWST Provide?

The James Webb Space Telescope (JWST) follows a single science calibration pipeline for processing all observational data. A **science calibration pipeline** is a series of automated data processing steps designed to convert raw observational data from scientific instruments into a form suitable for analysis and scientific interpretation. 

The JWST calibration pipeline has four stages which progressively refine  raw observational data, correcting for instrumental effects, normalizing sensitivities, combining multiple exposures, and preparing the data for detailed scientific analysis:

**1. Detector-Level Calibration**

> This stage corrects for basic instrumental effects and prepares the raw data for higher level calibration. This includes correcting for electronic bias and thermal noise by subtracting bias and dark frames, correcting for non-linear responses of the detector to light, identifying and flagging pixels that have reached or exceeded their saturation limits, converting raw counts to electrons using the detector’s gain, and detecting and flagging cosmic ray hits that may contaminate the data.

**2. Basic Calibration**

> This stage further refines the data by applying flat field corrections and additional calibrations, transforming the data into a form where flux values are accurate. 
>
> Flat-field correction normalizes pixel-to-pixel sensitivity variations using flat field images, which are images acquired by photographing a uniformly-illuminated screen, producing an image of uniform color and brightness across the frame (this can also be done with a clear patch of sky). 
>
> Photometric calibration applies corrections to ensure the flux values are consistent across the field of view, and, for spectroscopic data, wavelength calibration ensures that the wavelength scale is accurately calibrated using known spectral lines.

**3. Data Correction and Combination**

> This stage corrects for geometric distortions, combines multiple exposures, and prepares the data for scientific analysis.
>
> Geometric correction corrects optical distortions in the data to produce accurate spatial measurements.
> 
> Background subtraction involves removing background signals that are not part of the target object. This may also include cosmic ray rejection, a final cleanup of cosmic ray artifacts.
> 
> Image combination merges multiple images to improve data quality.

**4. Higher-Level Calibration and Analysis**

> This stage prepares data for specific scientific analyses, such as creating higher-level products and performing advanced calibrations. Steps may include astrometric calibration, spectral extraction, final photometric calibration, and data product generation.
> 
> Astrometric calibration ensures the spatial coordinates of the data are accurately aligned with celestial reference frames and coordinates.
> 
> Spectral extraction, for spectroscopic data, extracts one-dimensional spectra from two-dimensional data.
> 
> Final photometric calibration involves applying any additional corrections needed to ensure accurate flux measurements.
>
> Data product generation creates higher-level data products, such as combined images or spectral cubes.

As a result, the JWST produces different kinds of data in association with each stage:

**1. Stage 0: Uncalibrated Raw Data**
> Uncalibrated raw data comes directly from the telescope, containing basic detector readings.

**2. Stage 1: Detector-Level Corrections**
> Stage 1 data is corrected for initial detector effects and converted to counts per second.

**3. Stage 2: Calibrated Data**
> Stage 2 data possesses detailed calibrations, including world coordinates and photometric information.

**4. Stage 3: Science-Ready Data**
> Stage 3 data is fully calibrated data, often combined from multiple exposures, and is ready for scientific analysis.

**Included Data Extensions** for this data include:
> **2D Images:** `i2d.fits`
> 
> **3D Data Cubes:** `s3d.fits`
> 
> **1D Spectra:** `x1d.fits`

JWST produces different file formats:

**1. FITS (Flexible Image Transport System)**
> - FITS files are the primary format for JWST data, and are capable of storing complex data structures, including images and spectra.
> - They are used for almost all JWST data products, with multiple extensions for science, error, and data quality arrays.

**2. ASDF (Advanced Scientific Data Format)**
> - ASDF files are a human-readable format for hierarchical metadata and binary data, often included as extensions in FITS files for complex calibration data.

**3. ECSV (Enhanced Character Separated Values)**
> - ECSV files are a text-based format for tabular data, used for catalog data of identified sources.

**4. JSON (JavaScript Object Notation)**
> - JSON files are a language-independent format for structured data, used for describing relationships between multiple exposures.

To observe accretion discs, which are typically in the infrared spectrum, using JWST data, the best option is to use FITS files, particularly 3D data cubes (`s3d.fits`) and calibrated images (`cal.fits` and `i2d.fits`):
- FITS files can store detailed, high-precision data.
- FITS files can handle 2D images, 3D data cubes, and spectra.
- FITS headers include extensive metadata useful for analyzing observations.

## What Data Does Chandra Provide?
Similar to JWST, the Chandra X-Ray Observatory follows a science calibration pipeline that progressively refines raw observational data, correcting for instrumental effects, normalizing sensitivities, combining exposures, and preparing the data for scientific analysis:

**1. Initial Data Processing**
> This stage corrects for basic instrumental effects and prepares the raw data for higher-level calibration. It includes correcting for electronic noise, identifying and flagging hot pixels, and converting raw counts to calibrated units using the detector’s gain. It also involves detecting and flagging cosmic ray hits that may contaminate the data.

**2. Aspect Solution and Event Reprocessing**
> This stage further refines the data by applying corrections based on the spacecraft's aspect solution, which includes precise information on the telescope's pointing.
>
> Aspect correction ensures the accurate spatial positioning of X-ray events on the sky.
>
> Event reprocessing recalculates the position, energy, and time for each detected X-ray photon, ensuring high accuracy in the recorded data.

**3. Exposure Map Creation and Background Subtraction**
> This stage involves creating an exposure map, which accounts for variations in effective exposure time across the field of view.
>
> Background subtraction removes background signals that are not part of the target object, enhancing the visibility of the actual astronomical sources.

**4. Final Data Products and Scientific Analysis**
> This stage prepares data for specific scientific analyses, such as creating higher-level products and performing advanced calibrations. Steps may include astrometric calibration, spectral extraction, and the generation of various data products.
>
> Astrometric calibration ensures the spatial coordinates of the data are accurately aligned with celestial reference frames.
> 
> Spectral extraction, for spectroscopic data, extracts one-dimensional spectra from the two-dimensional data.
>
> Data product generation creates higher-level data products, such as combined images and spectral cubes.

Also like JWST, Chandra produces data in each stage of the pipeline:

**1. Stage 0: Raw Data**
> - Raw data comes directly from the telescope, containing basic detector readings.

**2. Stage 1: Aspect-Corrected Events**
> - Stage 1 data is corrected for the initial aspect solution--preliminary determination of the orientation and pointing of the observatory--which involves calculating the alignment of the telescope's optical analysis with respect to celestial coordinates using star tracker data, gyroscope data, guide star data, and alignment models.
> - This data is also reprocessed for event positions and energies.

**3. Stage 2: Calibrated Data**
> - Stage 2 data includes detailed calibrations such as exposure maps and background-subtracted images.

**4. Stage 3: Science-Ready Data**
> - Stage 3 data, also ready for scientific analysis like that from JWST, is fully calibrated and combined from multiple exposures.

Chandra's **Included Data Extensions** vary from JWST:
> **Event Lists:** Detailed lists of detected x-ray photons with positions, energies, and times.
> **Exposure Maps:** Images showing effective exposure time across the field of view.
> **Calibrated Images:** Background-subtracted and exposure-corrected images ready for analysis.

Chandra produces different file formats:
**1. FITS**
> - FITS files are the primary format for Chandra data due totheir ability to store complex data structures such as images and spectra.
> - Like JWST, they possess multiple extensions for science, error, and data quality arrays. 

**2. ASCII (American Standard Code for Information Interchange)**
> - ASCII files are text-based and used for tabular data, such as event lists.

**3. PHA (Pulse Height Analysis)**
> - PHA files are used for storing binned spectra, providing a standard format for spectral data analysis.

**4. RMF (Response Matrix File) and ARF (Auxillary Response File)**
> - RMF and ARF files describie the instrument's response and effective area, which is crucial in spectral analysis.

Chandra is an X-Ray telescope and thus is capable of observing accretion discs in the x-ray spectrum. FITS files are suitable for this--particularly event lists and calibrated images.

## Considering Data Types for Hierarchical Clustering Analysis

When using data produced by JWST and Chandra for HCA, it is important to have data that provides detailed and comparable measurements.

**FITS Files** are an easy option as they are the primary format for storing astronomical data and are capable of including images and spectra, among other data types.
> - FITS files can store complex datasets with multiple extensions, enabling comprehensive clustering analysis.

**Event Lists (Chandra)** and **Spectra (JWST)** can be used hand-in-hand for spectral analysis.

> Event Lists contain detailed information about each detected x-ray photon including its position, energy, and arrival time. Spectra provide information about the light emitted from an object, spread out by wavelength, including intensity and spectral lines. 
> - These data types can be used to analyze the energy or wavelength distribution emissions from discs.
> - By comparing spectral characteristics, such as the presence of specific emission or absorption lines, objects with similar spectral properties can be clustered together.

**3D Data Cubes**, a subset of `.fits` files, combine spatial and spectral information in a three-dimensional dataset where two dimensions correspond to spatial coordinates and the third dimension corresponds to wavelength.

> - 3D Data Cubes allow for a comprehensive analysis of how properties of discs change across both space and wavelength, clustering objects both based on spatial structure and spectral properties.

**Error Arrays and Data Quality Arrays** provide estimated uncertainties for each data point, while data quality arrays flag for potential issues within the data.

> - Including error estimates and data quality flags in HCA ensures reliability of results.
> - Objects with high-quality data and lower uncertainties can be prioritized.
