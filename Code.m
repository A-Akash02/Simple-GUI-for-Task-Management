function taskManagementGUI()
    % Create the main figure
    f = figure('Position', [300, 300, 400, 300], 'MenuBar', 'none', 'Name', 'Task Management', 'NumberTitle', 'off');

    % Create UI elements
    uicontrol('Style', 'text', 'Position', [50, 250, 300, 20], 'String', 'Enter Task:', 'FontSize', 12);
    taskInput = uicontrol('Style', 'edit', 'Position', [50, 220, 300, 30]);

    addButton = uicontrol('Style', 'pushbutton', 'Position', [50, 180, 140, 30], ...
        'String', 'Add Task', 'Callback', @addTask);

    deleteButton = uicontrol('Style', 'pushbutton', 'Position', [210, 180, 140, 30], ...
        'String', 'Delete Selected Task', 'Callback', @deleteTask);

    taskList = uicontrol('Style', 'listbox', 'Position', [50, 20, 300, 150]);

    % Initialize tasks as a persistent variable
    tasks = {}; 

    % Callback functions
    function addTask(~, ~)
        task = get(taskInput, 'String');
        if ~isempty(task)
            tasks{end+1} = task; % Add task to the list
            set(taskInput, 'String', ''); % Clear input field
            updateTaskList();
        else
            msgbox('Please enter a task.', 'Error', 'error');
        end
    end

    function deleteTask(~, ~)
        selected = get(taskList, 'Value');
        if ~isempty(selected) && selected > 0
            tasks(selected) = []; % Remove selected task
            updateTaskList();
        else
            msgbox('Please select a task to delete.', 'Error', 'error');
        end
    end

    function updateTaskList()
        set(taskList, 'String', tasks); % Update the listbox
        if isempty(tasks)
            set(taskList, 'Value', 0); % Clear selection if no tasks left
        end
    end
end
