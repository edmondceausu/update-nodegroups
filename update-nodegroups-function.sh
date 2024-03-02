# Update a list of all EKS clusters in the region
update-nodegroups() {
    REGION=$1
    clusters=($(aws eks list-clusters --region ${REGION} --output json | jq -r '.clusters[]'))

    # Loop through each cluster
    for cluster in ${clusters[@]}; do
        # Get a list of all nodegroups in the cluster
        nodegroups=($(aws eks list-nodegroups --cluster-name $cluster --region ${REGION} --output json | jq -r '.nodegroups[]'))

        # skip if there are no node groups
        echo "checking for nodegroups in $cluster"
        if [[ ${#nodegroups[@]} -eq 0]]; then
            echo "No nodegroups found in cluster $cluster."
            continue
        fi

        # Loop through each nodegroup
        for nodegroup in ${nodegroups[@]}; do
            # Update the nodegroup
            echo "Updating nodegroup $nodegroup in cluster $cluster..."
            echo $nodegroup
            aws eks update-nodegroup-version --cluster-name ${cluster} --nodegroup-name ${nodegroup} --region $REGION || echo $?
        done
    done
}

