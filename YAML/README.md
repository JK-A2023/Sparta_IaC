# YAML

## What is YAML:

1. Human-readable data serialization language.
2. Used for writing configuration files.
3. YAML is for data, not documents.
4. Follows hierarchy based on indentation.

It is popular because it is easy to read and understand.

## What is it used for:

1. Config files.
2. Recommended to write in YAML rather than JSON:
   1. They cre interchangable.
   2. YAML is more readable and user-friendly.
3. YAML used for Ansible Playbooks.
4. YAML used for Kubernetes resources and deployments.
5. YAML can be added to GitHub for source control, so changes can be tracked and audited.

## YAML in Ansible:

1. Ansible Playbooks used to orchestrate IT processes.
2. A playbook is a YAML file containing one (1) or more plays.
3. Is used to define the desired state of a system.

Each play can run one or more tasks, and each task invokes an Ansible Module.
An Ansible Playbook consists of maps and lists. To create a playbook, start a YAML list that names the play, then list taks in a sequence.
   

## YAML syntax:

```
#Comment: Student record
#Describes some characteristics and preferences
---
name: Martin D'vloper #key-value
age: 26
hobbies: 
  - painting #first list item
  - playing_music #second list item
  - cooking #third list item
programming_languages:
  java: Intermediate
  python: Advanced
  javascript: Beginner
favorite_food: 
  - vegetables: tomatoes 
  - fruits: 
      citrics: oranges 
      tropical: bananas
      nuts: peanuts
      sweets: raisins
```

However, when translated into Python:

```
[
    {
        "name": "Martin D'vloper",
        "age": 26,
        "hobbies": ["painting", "playing_music", "cooking"],
        "programming_languages": {
            "java": "Intermediate",
            "python": "Advanced",
            "javascript": "Beginner",
        },
        "favorite_food": [
            {"vegetables": "tomatoes"},
            {
                "fruits": {
                    "citrics": "oranges",
                    "tropical": "bananas",
                    "nuts": "peanuts",
                    "sweets": "raisins",
                }
            },
        ],
    }
]
```