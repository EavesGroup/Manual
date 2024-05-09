#!/bin/bash

## Account_info
#SBATCH --account=ucb-general

## QoS_type
#SBATCH --qos=normal

## note: this one will be empty for shas nodes
## Partition_name
#SBATCH --partition=amilan # alpine
#SBATCH --constraint=ib    # use the infiniband

## Job_name
#SBATCH --job-name=g16

#SBATCH -o o.%j       			# Name of stdout output file (%j expands to jobId)
#SBATCH -e e.%j				# name of error file

## Number_of_nodes
#SBATCH --nodes=1

## Number_of_processors
#SBATCH --ntasks=32
###SBATCH --ntasks-per-socket=16

## Job_Wall_Time
#SBATCH --time=04:00:00

#SBATCH --mail-user= YOUR EMAIL HERE
###SBATCH --mail-type=BEGIN               # email me when the job starts
###SBATCH --mail-type=END      		# email me when the job finishes
#SBATCH --mail-type=FAIL   		# email me if the job fails

#SBATCH --export=NONE                   # for modules on new nodes

# load modules required for MPI and VASP
module purge
module load gaussian/16_avx2

# Create ECHO option if not already present
if test "`echo -e`" = "-e" ; then ECHO=echo ; else ECHO="echo -e" ; fi

## useful directories
SUBM_DIR=$PWD # submitting directory
SCR_DIR=/scratch/alpine/$USER/${SLURM_JOB_ID}
JOBNAME=planar-root0-optGS  ## CHANGE TO MATCH YOUR INPUT FILE NAME

## Record calculation to jobs_log file
printf '%s\n' "${SLURM_JOB_ID}  ${SLURM_JOB_NAME}  $(date)  $HOSTNAME  ${SBATCH_ACCOUNT}  ${SUBM_DIR}" >> ~/jobs_log

StartTime=$( date +%s.%N ) # bash timing
## this clean_up function moves output to the submitting directory and cleans up scratch space
clean_up () {

	StopTime=$( date +%s.%N )
	printf "Elapsed(sec):  %.3F\n" $( $ECHO  "${StopTime}-${StartTime}"|bc ) > ${SLURM_JOB_ID}_Timed.bash

        $ECHO
	$ECHO "Moving results to head node ${SUBM_DIR}..."
	$ECHO "...done"	
	
	wait
	
	$ECHO "... done"
	$ECHO
	$ECHO "Changing directory to ${SUBM_DIR}"
	
	$ECHO "...done"
	$ECHO
	$ECHO "over and out"
}

set -P; shopt -s extglob

$ECHO
$ECHO
$ECHO "running gaussian program..."
## run program
export OMP_NUM_THREADS=1
g16 <${JOBNAME}.in >${JOBNAME}.log

$ECHO "gaussian done... over and out"

clean_up

## sometimes, jobs aren't recorded into ~/jobs_log; check if this happens and append to end of file if so
vijID=$( grep "${SLURM_JOB_ID}" ~/jobs_log | cut -f1 -d' ' )
if [[ $vijID == ${SLURM_JOB_ID} ]]; then
        exit 0
else
        ## Record calculation to jobs_log file
        printf '%s\n' "${SLURM_JOB_ID}  ${SLURM_JOB_NAME}  $(date)  $HOSTNAME  ${SBATCH_ACCOUNT}  ${SUBM_DIR}" >> ~/jobs_log
fi
