import "../tasks/tasks_interhost.wdl" as interhost

workflow mafft_and_trim {
    call interhost.multi_align_mafft as mafft

    scatter(alignment in mafft.alignments_by_chr) {
        call interhost.trimal_clean_msa as trimal {
            input:
                in_aligned_fasta = alignment
        }
    }
}