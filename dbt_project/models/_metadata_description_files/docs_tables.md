# List of all table descriptions

## Kids First Dataservice Tables - Source Stage 

{% docs src_bsgf %}
Kids First Dataservivce source table for linking specimens to genomic files. One file may be linked to many specimens. 
{% enddocs %}

{% docs src_diagnosis %}
Kids First Dataservice source table for harmonized conditions curated to MONDO codes at the patient level. All conditions in this table are implied to be observed in patients. Each row represents one condition per patient. 
{% enddocs %}

{% docs src_family %}
Kids First Dataservice source table that holds family ids for each participant. This table can be joined to src_participants to obtain participant to family id mappings. 
{% enddocs %}

{% docs src_genomic_files %}
Kids First Dataservice source table that holds raw and harmonized genomic file outputs. This table provides file and bioinformatic workflow metadata for each file. Must be joined to src_bsgf to obtain specimen to file mappings.
{% enddocs %}

{% docs src_investigator %}
Kids First Dataservice source table for investigator information. Only contains minimal contact information for the Principle Investigator of a study. One investigator may be associated to multiple study ids. 
{% enddocs %}

{% docs src_participant %}
Kids First Dataservice source table for participant demographic information. Also contains information regarding a participant's affected status. Links each participant to an assigned family id from src_family and an assigned study id from src_study. 
{% enddocs %}

{% docs src_phenotype %}
Kids First Dataservice source table for harmonized conditions curated to HPO codes at the patient level. Conditions can be observed or not observed in a patient. Each row represents one condition and observation status per patient. 
{% enddocs %}

{% docs src_segf %}
Kids First Dataservice source table for linking sequencing experiments to genomic files. Multiple files can be linked to one sequencing experiment.
{% enddocs %}

{% docs src_sequencing_experiments %}
Kids First Dataservice source table for sequencing experiments that holds sequencing metadata. 
{% enddocs %}

{% docs src_specimens %}
Kids First Dataservice source table for biospecimen information. Contains specimen collection information and specimen material information, as well as VBR specific entities to support CBTN VBR fields. Each row represents one aliquot per participant. 
{% enddocs %}

{% docs src_study %}
Kids First Dataservice source table for study metadata. Contains full and short study names, study codes, study program, and dbgap phs numbers. 
{% enddocs %}

## Kids First Dataservice Tables - Int Stage

{% docs int_bsgf %}
Intermediate table for src_bsgf. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed. 
{% enddocs %}

{% docs int_diagnosis %}
Intermediate table for src_diagnosis. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed. 
{% enddocs %}

{% docs int_family %}
Intermediate table for src_family. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs int_genomic_files %}
Intermediate table for src_genomic_files. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs int_investigator %}
Intermediate table for src_investigator. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs int_participant %}
Intermediate table for src_participant. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs int_phenotype %}
Intermediate table for src_phenotype. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs int_segf %}
Intermediate table for src_segf. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs int_sequencing_experiment %}
Intermediate table for src_sequencing_experiments. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs int_specimens %}
Intermediate table for src_specimens. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs int_study %}
Intermediate table for src_study. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

## Kids First Dataservice Tables - Stable Stage 

{% docs stable_bsgf %}
Stable table for int_bsgf. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs stable_diagnosis %}
Stable table for int_diagnosis. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs stable_family %}
Stable table for int_family. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs stable_genomic_file %}
Stable table for int_families. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs stable_investigator %}
Stable table for int_investigator. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs stable_participant %}
Stable table for int_participant. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs stable_phenotype %}
Stable table for int_phenotype. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs stable_segf %}
Stable table for int_segf. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs stable_sequencing_experiment %}
Stable table for int_sequencing_experiment. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs stable_specimens %}
Stable table for int_specimens. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs stable_study %}
Stable table for int_study. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}


## Kids First Study SD_1NNS3K8V 
{% docs kf_sd_1nns3k8v_src_clinical %}
Source table for Cody study source clinical data 
{% enddocs %}

{% docs kf_sd_1nns3k8v_src_sequencing %}
Source table for Cody study source sequencing data 
{% enddocs %}

{% docs kf_sd_1nns3k8v_src_s3 %}
Source table for Cody study s3 file manifest
{% enddocs %}

{% docs kf_sd_1nns3k8v_int_clinical %}
Intermediate table for src_clinical. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed. 
{% enddocs %}

{% docs kf_sd_1nns3k8v_int_sequencing %}
Intermediate table for src_sequencing. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed. 
{% enddocs %}

{% docs kf_sd_1nns3k8v_int_s3 %}
Intermediate table for src_s3. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed. 
{% enddocs %}