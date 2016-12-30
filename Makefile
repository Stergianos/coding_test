ROOT_DIR=adzuna-coding-task
COMPLETED_TASK=completed-task.tgz
EMPTY_TASK=/tmp/task.tgz

.PHONY: doc all export _task

all: doc _task

export:
	cd .. && tar cvzf $(COMPLETED_TASK) $(ROOT_DIR)/
	@echo -e "\n\nYou can now send back the file '$(COMPLETED_TASK)' which you can find on the parent directory"

_task: doc
	git archive --format=tar.gz --prefix=$(ROOT_DIR)/ -o $(EMPTY_TASK) task_for_candidate

doc:
	$(MAKE) -C doc/

clean:
	$(MAKE) -C doc/ clean
