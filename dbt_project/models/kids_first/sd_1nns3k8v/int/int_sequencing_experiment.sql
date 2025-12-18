{{ config(
    schema='int'
) }}

select distinct 
    kf_id as sequencing_experiment_id, 
    sequencing_center_id,
    external_id,
    experiment_date,
    experiment_strategy,
    is_paired_end,
    platform,
    instrument_model,
    visible,
    visibility_reason, 
    visibility_comment,

  -- I think these should be included? talk with BIX
    library_name,
    library_strand,
    library_prep,
    library_selection,
    max_insert_size,
    mean_insert_size,
    mean_depth,
    total_reads,
    mean_read_length

     /*
        TODO: discuss with bix necessary fields to include
      */
    -- adapter_sequencing,
    -- is_adapter_trimmed,
    -- read_pair_number,
    -- target_capture_kit,
    -- acquisition_type,
    -- cdna_read,
    -- cdna_read_offset,
    -- cell_barcode_offset,
    -- cell_barcode_read,
    -- cell_barcode_size,
    -- chromatography_approach,
    -- end_bias,
    -- enrichment_approach,
    -- fraction_number,
    -- fractionation_approach,
    -- ion_fragmentation,
    -- library_construction,
    -- mass_spec_rawfile_conversion,
    -- proteomics_experiment,
    -- quantification_label_id,
    -- quantification_labeling_method,
    -- quantification_technique,
    -- sequencing_mode,
    -- target_cell_number,
    -- umi_barcode_offset,
    -- umi_barcode_read,
    -- umi_barcode_size,

from {{ ref('src_sequencing_experiments')}}