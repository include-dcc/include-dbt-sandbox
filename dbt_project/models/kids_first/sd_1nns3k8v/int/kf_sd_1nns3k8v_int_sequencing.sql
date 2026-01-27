{{ config(
    schema='int'
) }}

select distinct
    "entity:sample_id" as sample_id,
    -- "project" as project,
    "collaborator_sample_id" as collaborator_sample_id,
    -- "version" as version,
    -- "data_type" as data_type,
    -- "pdo" as pdo,
    -- "release_date" as release_date,
    -- "reference_sequence_name" as reference_sequence_name,
    "collaborator_participant_id" as collaborator_participant_id,
    "cram_path" as cram_path,
    "crai_path" as crai_path,
    "md5_path" as md5_path,
    "root_sample_id" as root_sample_id,
    "mean_coverage" as mean_coverage,
    -- "adapter_rate" as adapter_rate,
    -- "pf_hq_aligned_q20_bases" as pf_hq_aligned_q20_bases,
    -- "pf_hq_aligned_reads" as pf_hq_aligned_reads,
    -- "pf_mismatch_rate" as pf_mismatch_rate,
    -- "pf_noise_reads" as pf_noise_reads,
    -- "pf_reads" as pf_reads,
    -- "pf_reads_aligned" as pf_reads_aligned,
    "total_reads" as total_reads,
    "mean_read_length" as mean_read_length
    -- "pf_reads_rate" as pf_reads_rate,
    -- "pf_reads_aligned_rate" as pf_reads_aligned_rate,
    -- "pf_aligned_bases" as pf_aligned_bases,
    -- "reads_aligned_in_pairs" as reads_aligned_in_pairs,

from {{ ref('kf_sd_1nns3k8v_src_sequencing') }}