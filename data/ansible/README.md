pipx install --include-deps ansible
pipx install ansible-core

ansible-playbook -i inventories/hosts -e "instance_id=i-xxxxxxxxxxxx" playbooks/auto-restart-ec2-instance.yml

ansible deployment_config -m ping -i inventories/hosts


# Install virtual environment
pip install virtualenv

# Create virtual environment
python -m venv myenv

# Activate virtual environment
source myenv/bin/activate

# Install requirements
pip install -r requirements.txt


# Install the aws package using ansible galaxy

ansible-galaxy collection install amazon.aws --force
ansible-galaxy collection install community.aws


# Changing the path location for the ansible-core if required

vim ~/.bash_profile  
export PATH="/Users/binayadai/.local/pipx/venvs/ansible-core/bin:$PATH"
or you must likely need to concat with the python path

export PATH="$HOME/Library/Python/3.7/bin:/Users/binayadai/.local/pipx/venvs/ansible-core/bin:$PATH"

source ~/.bash_profile


# Rundeck command

INSTANCE_ID=($RD_OPTION_INSTANCE_ID) && AMI_ID=($RD_OPTION_AMI_ID) && INSTANCE_TYPE=($RD_OPTION_INSTANCE_TYPE) && cd /opt/ansible && ansible-playbook -i inventories/hosts playbooks/auto-restart-ec2-instance.yml -e "instance_id=$INSTANCE_ID"  -v

# Rundeck Webhook payload

-host ${data.host} -condition_name ${data.condition_name} -timestamp ${data.timestamp} -instance_id ${data.instance_id} 

# Rundeck authorization key

EpGYuwxrnjJ2eN2FooIAtMFZSI8FFpKj


{
	"host": {{ json accumulations.tag.hostname.[0] }},
	"condition_name": {{ json accumulations.conditionName.[0] }},
	"timestamp": {{ createdAt }},
	"instance_id" : {{ json accumulations.tag.host.id.[0] }}
}
Client request(http://3.108.190.104:4440/api/41/webhook/7PuD6tlWBeaGrpY8Vj2OTbh8eksGh8sV#Auto_recovery_of_EC2_instance) invalid: 400 Bad Request. Text: "{"err":"Failed webhook authorization"}"