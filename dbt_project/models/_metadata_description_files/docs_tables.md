# List of all table descriptions

## Kids First Dataservice Tables - Source Stage 

{% docs kf_ds_src_bsgf %}
Kids First Dataservivce source table for linking specimens to genomic files. One file may be linked to many specimens. 
{% enddocs %}

{% docs kf_ds_src_diagnosis %}
Kids First Dataservice source table for harmonized conditions curated to MONDO codes at the patient level. All conditions in this table are implied to be observed in patients. Each row represents one condition per patient. 
{% enddocs %}

{% docs kf_ds_src_family %}
Kids First Dataservice source table that holds family ids for each participant. This table can be joined to kf_ds_src_participants to obtain participant to family id mappings. 
{% enddocs %}

{% docs kf_ds_src_family_relationship %}
Kids First Dataservice source table that holds family relationships for each participant. Usually only reports relationships for duos, trios, or trios+. 
{% enddocs %}

{% docs kf_ds_src_genomic_file %}
Kids First Dataservice source table that holds raw and harmonized genomic file outputs. This table provides file and bioinformatic workflow metadata for each file. Must be joined to kf_ds_src_bsgf to obtain specimen to file mappings.
{% enddocs %}

{% docs kf_ds_src_investigator %}
Kids First Dataservice source table for investigator information. Only contains minimal contact information for the Principle Investigator of a study. One investigator may be associated to multiple study ids. 
{% enddocs %}

{% docs kf_ds_src_outcome %}
Kids First Dataservice source table for outcome information. Reports the vital status of patients and whether or not death was disease related.
{% enddocs %}

{% docs kf_ds_src_participant %}
Kids First Dataservice source table for participant demographic information. Also contains information regarding a participant's affected status. Links each participant to an assigned family id from kf_ds_src_family and an assigned study id from kf_ds_src_study. 
{% enddocs %}

{% docs kf_ds_src_phenotype %}
Kids First Dataservice source table for harmonized conditions curated to HPO codes at the patient level. Conditions can be observed or not observed in a patient. Each row represents one condition and observation status per patient. 
{% enddocs %}

{% docs kf_ds_src_sample %}
Kids First Dataservice source table for samples.
{% enddocs %}

{% docs kf_ds_src_segf %}
Kids First Dataservice source table for linking sequencing experiments to genomic files. Multiple files can be linked to one sequencing experiment.
{% enddocs %}

{% docs kf_ds_src_sequencing_center %}
Kids First Dataserivce source table for sequencing center information.
{% enddocs %}

{% docs kf_ds_src_sequencing_experiment %}
Kids First Dataservice source table for sequencing experiments that holds sequencing metadata. 
{% enddocs %}

{% docs kf_ds_src_biospecimen %}
Kids First Dataservice source table for biospecimen information. Contains specimen collection information and specimen material information, as well as VBR specific entities to support CBTN VBR fields. Each row represents one aliquot per participant. 
{% enddocs %}

{% docs kf_ds_src_study %}
Kids First Dataservice source table for study metadata. Contains full and short study names, study codes, study program, and dbgap phs numbers. 
{% enddocs %}

## Kids First Dataservice Tables - Int Stage

{% docs kf_ds_int_bsgf %}
Intermediate table for kf_ds_src_bsgf. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed. 
{% enddocs %}

{% docs kf_ds_int_diagnosis %}
Intermediate table for kf_ds_src_diagnosis. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed. 
{% enddocs %}

{% docs kf_ds_int_family %}
Intermediate table for kf_ds_src_family. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_family_relationship %}
Intermediate table for kf_ds_src_family_relationship. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_genomic_file %}
Intermediate table for kf_ds_src_genomic_files. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_investigator %}
Intermediate table for kf_ds_src_investigator. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_outcome %}
Intermediate table for kf_ds_src_outcome. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_participant %}
Intermediate table for kf_ds_src_participant. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_phenotype %}
Intermediate table for kf_ds_src_phenotype. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_sample %}
Intermediate table for kf_ds_src_sample. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_sequencing_center %}
Intermediate table for kf_ds_src_sequencing_center. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_segf %}
Intermediate table for kf_ds_src_segf. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_sequencing_experiment %}
Intermediate table for kf_ds_src_sequencing_experiments. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_biospecimen %}
Intermediate table for kf_ds_src_biospecimen. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

{% docs kf_ds_int_study %}
Intermediate table for kf_ds_src_study. Transforms dataservice entities for better usability and clarity. Excludes certain entites that are not needed.
{% enddocs %}

## Kids First Dataservice Tables - Stable Stage 

{% docs kf_ds_stable_bsgf %}
Stable table for kf_ds_int_bsgf. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_diagnosis %}
Stable table for kf_ds_int_diagnosis. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_family %}
Stable table for kf_ds_int_family. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_int_family_relationship %}
Stable table for kf_ds_src_family_relationship. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_genomic_file %}
Stable table for kf_ds_int_families. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_investigator %}
Stable table for kf_ds_int_investigator. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_outcome %}
Stable table for kf_ds_int_outcome. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_participant %}
Stable table for kf_ds_int_participant. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_phenotype %}
Stable table for kf_ds_int_phenotype. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_sample %}
Stable table for kf_ds_int_sample. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_sequencing_center %}
Stable table for kf_ds_int_sequencing_center. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_segf %}
Stable table for kf_ds_int_segf. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_sequencing_experiment %}
Stable table for kf_ds_int_sequencing_experiment. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_biospecimen %}
Stable table for kf_ds_int_biospecimen. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}

{% docs kf_ds_stable_study %}
Stable table for kf_ds_int_study. Finalized mapping of transformed dataservice entities that are ready to be brought into the access layer.
{% enddocs %}