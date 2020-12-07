function varargout = DetectionRecord(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DetectionRecord_OpeningFcn, ...
                   'gui_OutputFcn',  @DetectionRecord_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DetectionRecord is made visible.
function DetectionRecord_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for DetectionRecord
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.BGTable,'visible','off')
set(handles.BPTable,'visible','off')
set(handles.TempTable,'visible','off')
set(handles.PulseTable,'visible','off')


% --- Outputs from this function are returned to the command line.
function varargout = DetectionRecord_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Selection.
function Selection_Callback(hObject, eventdata, handles)
%set(hObject,'Enable','off')
%drawnow;
%set(hObject,'Enable','on')
contents = get(handles.Selection,'String');
Selection_Value = contents{get(handles.Selection,'Value')};

D = load ('Doctorname.mat');
DD = struct2cell(D);
DDD = string(DD);
    
I = load ('ID.mat');
II = struct2cell(I);
III = string(II);
                
N = load ('username.mat');
NN = struct2cell(N);
NNN = string(NN);
                
C = load ('IC.mat');
CC = struct2cell(C);
CCC = string(CC);
                
PatientFolder = sprintf('HospitalBloodDetection/%s(%s)/PatientRecord',DDD,III);
                
dbfile = fullfile(PatientFolder,sprintf('%s(%s).s3db',NNN,CCC));

W = get(handles.dates,'String');

switch Selection_Value
    case 'Random'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT * FROM RandomTable');
        set(handles.OverallTable,'Data', Table);
        
        G = get(handles.BGlucose,'Value')
        H = get(handles.Temp,'Value')
        BP = get(handles.BPressure,'Value')
        P = get(handles.PulseRate,'Value')
        if G == 1
            BGlucose_Callback(hObject, eventdata, handles)
        elseif H == 1
            Temp_Callback(hObject, eventdata, handles)
        elseif BP == 1
            BPressure_Callback(hObject, eventdata, handles)
        elseif P == 1
            PulseRate_Callback(hObject, eventdata, handles)
        end
        
        
    case 'Fasting / Before Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT * FROM FastingTable');
        set(handles.OverallTable,'Data', Table);
         
        G = get(handles.BGlucose,'Value')
        H = get(handles.Temp,'Value')
        BP = get(handles.BPressure,'Value')
        P = get(handles.PulseRate,'Value')
        if G == 1
            BGlucose_Callback(hObject, eventdata, handles)
        elseif H == 1
            Temp_Callback(hObject, eventdata, handles)
        elseif BP == 1
            BPressure_Callback(hObject, eventdata, handles)
        elseif P == 1
            PulseRate_Callback(hObject, eventdata, handles)
        end
        
    case 'Two(2) Hours After Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT * FROM AfterMealTable');
        set(handles.OverallTable,'Data', Table);
        
        G = get(handles.BGlucose,'Value')
        H = get(handles.Temp,'Value')
        BP = get(handles.BPressure,'Value')
        P = get(handles.PulseRate,'Value')
        if G == 1
            BGlucose_Callback(hObject, eventdata, handles)
        elseif H == 1
            Temp_Callback(hObject, eventdata, handles)
        elseif BP == 1
            BPressure_Callback(hObject, eventdata, handles)
        elseif P == 1
            PulseRate_Callback(hObject, eventdata, handles)
        end
        
    case 'Overall'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT * FROM OverallRecordTable');
        set(handles.OverallTable,'Data', Table);
        
        G = get(handles.BGlucose,'Value')
        H = get(handles.Temp,'Value')
        BP = get(handles.BPressure,'Value')
        P = get(handles.PulseRate,'Value')
        if G == 1
            BGlucose_Callback(hObject, eventdata, handles)
        elseif H == 1
            Temp_Callback(hObject, eventdata, handles)
        elseif BP == 1
            BPressure_Callback(hObject, eventdata, handles)
        elseif P == 1
            PulseRate_Callback(hObject, eventdata, handles)
        end
        
end


% --- Executes during object creation, after setting all properties.
function Selection_CreateFcn(hObject, eventdata, handles)
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BGlucose.
function BGlucose_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of BGlucose
set(handles.OverallTable,'visible','off');
set(handles.BPTable,'visible','off');
set(handles.TempTable,'visible','off');
set(handles.PulseTable,'visible','off');
set(handles.BGTable,'visible','on');

set(handles.Temp,'Value',0);
set(handles.BPressure,'Value',0);
set(handles.PulseRate,'Value',0);

contents = get(handles.Selection,'String');
Selection_Value = contents{get(handles.Selection,'Value')};

D = load ('Doctorname.mat');
DD = struct2cell(D);
DDD = string(DD);
    
I = load ('ID.mat');
II = struct2cell(I);
III = string(II);
                
N = load ('username.mat');
NN = struct2cell(N);
NNN = string(NN);
                
C = load ('IC.mat');
CC = struct2cell(C);
CCC = string(CC);
                
PatientFolder = sprintf('HospitalBloodDetection/%s(%s)/PatientRecord',DDD,III);
                
dbfile = fullfile(PatientFolder,sprintf('%s(%s).s3db',NNN,CCC));


switch Selection_Value
    case 'Random'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, BGL, BGStatus FROM RandomTable');
        set(handles.BGTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.BGTable,'Data',{});
            set(handles.BGTable,'Data',F);
        end
        
    case 'Fasting / Before Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, BGL, BGStatus FROM FastingTable');
        set(handles.BGTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.BGTable,'Data',{});
            set(handles.BGTable,'Data',F);
        end
        
    case 'Two(2) Hours After Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, BGL, BGStatus FROM AfterMealTable');
        set(handles.BGTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.BGTable,'Data',{});
            set(handles.BGTable,'Data',F);
        end
        
    case 'Overall'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, BGL, BGStatus FROM OverallRecordTable');
        set(handles.BGTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.BGTable,'Data',{});
            set(handles.BGTable,'Data',F);
        end
        
end

G = get(handles.BGlucose,'Value');

if G==0
    set(handles.OverallTable,'visible','on');
    set(handles.BPTable,'visible','off');
    set(handles.TempTable,'visible','off');
    set(handles.PulseTable,'visible','off');
    set(handles.BGTable,'visible','off');
end

% --- Executes on button press in Temp.
function Temp_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of Temp
set(handles.OverallTable,'visible','off');
set(handles.BPTable,'visible','off');
set(handles.TempTable,'visible','on');
set(handles.PulseTable,'visible','off');
set(handles.BGTable,'visible','off');

set(handles.BGlucose,'Value',0);
set(handles.BPressure,'Value',0);
set(handles.PulseRate,'Value',0);

contents = get(handles.Selection,'String');
Selection_Value = contents{get(handles.Selection,'Value')};

D = load ('Doctorname.mat');
DD = struct2cell(D);
DDD = string(DD);
    
I = load ('ID.mat');
II = struct2cell(I);
III = string(II);
                
N = load ('username.mat');
NN = struct2cell(N);
NNN = string(NN);
                
C = load ('IC.mat');
CC = struct2cell(C);
CCC = string(CC);
                
PatientFolder = sprintf('HospitalBloodDetection/%s(%s)/PatientRecord',DDD,III);
                
dbfile = fullfile(PatientFolder,sprintf('%s(%s).s3db',NNN,CCC));

switch Selection_Value
    case 'Random'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, Temperature FROM RandomTable');
        set(handles.TempTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.TempTable,'Data',{});
            set(handles.TempTable,'Data',F);
        end
        
    case 'Fasting / Before Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, Temperature FROM FastingTable');
        set(handles.TempTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.TempTable,'Data',{});
            set(handles.TempTable,'Data',F);
        end
        
    case 'Two(2) Hours After Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, Temperature FROM AfterMealTable');
        set(handles.TempTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.TempTable,'Data',{});
            set(handles.TempTable,'Data',F);
        end
        
    case 'Overall'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, Temperature FROM OverallRecordTable');
        set(handles.TempTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.TempTable,'Data',{});
            set(handles.TempTable,'Data',F);
        end
        
end

T = get(handles.Temp,'Value');

if T==0
    set(handles.OverallTable,'visible','on');
    set(handles.BPTable,'visible','off');
    set(handles.TempTable,'visible','off');
    set(handles.PulseTable,'visible','off');
    set(handles.BGTable,'visible','off');
end

% --- Executes on button press in BPressure.
function BPressure_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of BPressure
set(handles.OverallTable,'visible','off');
set(handles.BPTable,'visible','on');
set(handles.TempTable,'visible','off');
set(handles.PulseTable,'visible','off');
set(handles.BGTable,'visible','off');

set(handles.BGlucose,'Value',0);
set(handles.Temp,'Value',0);
set(handles.PulseRate,'Value',0);

contents = get(handles.Selection,'String');
Selection_Value = contents{get(handles.Selection,'Value')};

D = load ('Doctorname.mat');
DD = struct2cell(D);
DDD = string(DD);
    
I = load ('ID.mat');
II = struct2cell(I);
III = string(II);
                
N = load ('username.mat');
NN = struct2cell(N);
NNN = string(NN);
                
C = load ('IC.mat');
CC = struct2cell(C);
CCC = string(CC);
                
PatientFolder = sprintf('HospitalBloodDetection/%s(%s)/PatientRecord',DDD,III);
                
dbfile = fullfile(PatientFolder,sprintf('%s(%s).s3db',NNN,CCC));

switch Selection_Value
    case 'Random'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, Systolic, Diastolic, BPStatus FROM RandomTable');
        set(handles.BPTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.BPTable,'Data',{});
            set(handles.BPTable,'Data',F);
        end
        
    case 'Fasting / Before Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, Systolic, Diastolic, BPStatus FROM FastingTable');
        set(handles.BPTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.BPTable,'Data',{});
            set(handles.BPTable,'Data',F);
        end
        
    case 'Two(2) Hours After Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, Systolic, Diastolic, BPStatus FROM AfterMealTable');
        set(handles.BPTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.BPTable,'Data',{});
            set(handles.BPTable,'Data',F);
        end
        
    case 'Overall'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, Systolic, Diastolic, BPStatus FROM OverallRecordTable');
        set(handles.BPTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.BPTable,'Data',{});
            set(handles.BPTable,'Data',F);
        end
        
end

BP = get(handles.BPressure,'Value');

if BP==0
    set(handles.OverallTable,'visible','on');
    set(handles.BPTable,'visible','off');
    set(handles.TempTable,'visible','off');
    set(handles.PulseTable,'visible','off');
    set(handles.BGTable,'visible','off');
end

% --- Executes on button press in PulseRate.
function PulseRate_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of PulseRate
set(handles.OverallTable,'visible','off');
set(handles.BPTable,'visible','off');
set(handles.TempTable,'visible','off');
set(handles.PulseTable,'visible','on');
set(handles.BGTable,'visible','off');

set(handles.BGlucose,'Value',0);
set(handles.BPressure,'Value',0);
set(handles.Temp,'Value',0);

contents = get(handles.Selection,'String');
Selection_Value = contents{get(handles.Selection,'Value')};

D = load ('Doctorname.mat');
DD = struct2cell(D);
DDD = string(DD);
    
I = load ('ID.mat');
II = struct2cell(I);
III = string(II);
                
N = load ('username.mat');
NN = struct2cell(N);
NNN = string(NN);
                
C = load ('IC.mat');
CC = struct2cell(C);
CCC = string(CC);
                
PatientFolder = sprintf('HospitalBloodDetection/%s(%s)/PatientRecord',DDD,III);
                
dbfile = fullfile(PatientFolder,sprintf('%s(%s).s3db',NNN,CCC));

W = get(handles.dates,'String');

switch Selection_Value
    case 'Random'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, PulseRate FROM RandomTable');
        set(handles.PulseTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.PulseTable,'Data',{});
            set(handles.PulseTable,'Data',F);
        end
        
    case 'Fasting / Before Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, PulseRate FROM FastingTable');
        set(handles.PulseTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.PulseTable,'Data',{});
            set(handles.PulseTable,'Data',F);
        end
        
    case 'Two(2) Hours After Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, PulseRate FROM AfterMealTable');
        set(handles.PulseTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.PulseTable,'Data',{});
            set(handles.PulseTable,'Data',F);
        end
        
    case 'Overall'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT DateTime, PulseRate FROM OverallRecordTable');
        set(handles.PulseTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.PulseTable,'Data',{});
            set(handles.PulseTable,'Data',F);
        end
        
end

P = get(handles.PulseRate,'Value');

if P==0
    set(handles.OverallTable,'visible','on');
    set(handles.BPTable,'visible','off');
    set(handles.TempTable,'visible','off');
    set(handles.PulseTable,'visible','off');
    set(handles.BGTable,'visible','off');
end



function dates_Callback(hObject, eventdata, handles)
% hObject    handle to dates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dates as text
%        str2double(get(hObject,'String')) returns contents of dates as a double


% --- Executes during object creation, after setting all properties.
function dates_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in choosedate.
function choosedate_Callback(hObject, eventdata, handles)
% hObject    handle to choosedate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.dates,'String','');
D = uicontrol(handles.dates)
uicalendar('DestinationUI',{D,'String'})
date = get(D,'String');
set(handles.dates,'String', date);

Selection_Callback(hObject, eventdata, handles)


% --- Executes on button press in Print.
function Print_Callback(hObject, eventdata, handles)
% hObject    handle to Print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete('Print.xls')
contents = get(handles.Selection,'String');
Selection_Value = contents{get(handles.Selection,'Value')};

G = get(handles.BGlucose,'Value');
H = get(handles.Temp,'Value');
BP = get(handles.BPressure,'Value');
P = get(handles.PulseRate,'Value');
        
switch Selection_Value
    case 'Random'
        if G == 1
            Table = get(handles.BGTable,'Data');
            Title = [{'Datetime', 'GlucoseLevel','BGStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif H == 1
            Table = get(handles.TempTable,'Data');
            Title = [{'Datetime', 'Temperature'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif BP == 1
            Table = get(handles.BPTable,'Data');
            Title = [{'Datetime', 'Systolic Pressure','Diastolic Pressure','BPStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif P == 1
            Table = get(handles.PulseTable,'Data');
            Title = [{'Datetime', 'Pulse Rate'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif (G == 0) && (H == 0) && (BP == 0) && (P == 0)
            Table = get(handles.OverallTable,'Data');
            Title = [{'Datetime', 'GlucoseLevel','Temperature','Systolic Pressure','Diastolic Pressure',...
                'Pulse Rate','BGStatus','BPStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        end
        
        file = fullfile(pwd,'Print.xls');
        Excel = actxserver('Excel.Application');
        Workbooks = Excel.Workbooks;
        Excel.Visible = 1;
        Workbook = Workbooks.Open(file);
        Excel.Columns.Item('A:H').ColumnWidth = 17;
        
    case 'Fasting / Before Meal'
        if G == 1
            Table = get(handles.BGTable,'Data');
            Title = [{'Datetime', 'GlucoseLevel','BGStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif H == 1
            Table = get(handles.TempTable,'Data');
            Title = [{'Datetime', 'Temperature'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif BP == 1
            Table = get(handles.BPTable,'Data');
            Title = [{'Datetime', 'Systolic Pressure','Diastolic Pressure','BPStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif P == 1
            Table = get(handles.PulseTable,'Data');
            Title = [{'Datetime', 'Pulse Rate'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif (G == 0) && (H == 0) && (BP == 0) && (P == 0)
            Table = get(handles.OverallTable,'Data');
            Title = [{'Datetime', 'GlucoseLevel','Temperature','Systolic Pressure','Diastolic Pressure',...
                'Pulse Rate','BGStatus','BPStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        end
        
        file = fullfile(pwd,'Print.xls');
        Excel = actxserver('Excel.Application');
        Workbooks = Excel.Workbooks;
        Excel.Visible = 1;
        Workbook = Workbooks.Open(file);
        Excel.Columns.Item('A:H').ColumnWidth = 17;
        
    case 'Two(2) Hours After Meal'
        if G == 1
            Table = get(handles.BGTable,'Data');
            Title = [{'Datetime', 'GlucoseLevel','BGStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif H == 1
            Table = get(handles.TempTable,'Data');
            Title = [{'Datetime', 'Temperature'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif BP == 1
            Table = get(handles.BPTable,'Data');
            Title = [{'Datetime', 'Systolic Pressure','Diastolic Pressure','BPStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif P == 1
            Table = get(handles.PulseTable,'Data');
            Title = [{'Datetime', 'Pulse Rate'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif (G == 0) && (H == 0) && (BP == 0) && (P == 0)
            Table = get(handles.OverallTable,'Data');
            Title = [{'Datetime', 'GlucoseLevel','Temperature','Systolic Pressure','Diastolic Pressure',...
                'Pulse Rate','BGStatus','BPStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        end
        
        file = fullfile(pwd,'Print.xls');
        Excel = actxserver('Excel.Application');
        Workbooks = Excel.Workbooks;
        Excel.Visible = 1;
        Workbook = Workbooks.Open(file);
        Excel.Columns.Item('A:H').ColumnWidth = 17;
        
    case 'Overall'
        if G == 1
            Table = get(handles.BGTable,'Data');
            Title = [{'Datetime', 'GlucoseLevel','BGStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif H == 1
            Table = get(handles.TempTable,'Data');
            Title = [{'Datetime', 'Temperature'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif BP == 1
            Table = get(handles.BPTable,'Data');
            Title = [{'Datetime', 'Systolic Pressure','Diastolic Pressure','BPStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif P == 1
            Table = get(handles.PulseTable,'Data');
            Title = [{'Datetime', 'Pulse Rate'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        elseif (G == 0) && (H == 0) && (BP == 0) && (P == 0)
            Table = get(handles.OverallTable,'Data');
            Title = [{'Datetime', 'GlucoseLevel','Temperature','Systolic Pressure','Diastolic Pressure',...
                'Pulse Rate','BGStatus','BPStatus'}];
            Table2 = vertcat(Title,Table);
            xlswrite('Print.xls', Table2); 
        end
        
        file = fullfile(pwd,'Print.xls');
        Excel = actxserver('Excel.Application');
        Workbooks = Excel.Workbooks;
        Excel.Visible = 1;
        Workbook = Workbooks.Open(file);
        Excel.Columns.Item('A:H').ColumnWidth = 17;
end


% --- Executes on button press in Search.
function Search_Callback(hObject, eventdata, handles)
% hObject    handle to Search (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = get(handles.Selection,'String');
Selection_Value = contents{get(handles.Selection,'Value')};

D = load ('Doctorname.mat');
DD = struct2cell(D);
DDD = string(DD);
    
I = load ('ID.mat');
II = struct2cell(I);
III = string(II);
                
N = load ('username.mat');
NN = struct2cell(N);
NNN = string(NN);
                
C = load ('IC.mat');
CC = struct2cell(C);
CCC = string(CC);
                
PatientFolder = sprintf('HospitalBloodDetection/%s(%s)/PatientRecord',DDD,III);
                
dbfile = fullfile(PatientFolder,sprintf('%s(%s).s3db',NNN,CCC));

W = get(handles.dates,'String');

switch Selection_Value
    case 'Random'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT * FROM RandomTable');
        set(handles.OverallTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.OverallTable,'Data',{});
            set(handles.OverallTable,'Data',F);
        end
        
        G = get(handles.BGlucose,'Value');
        H = get(handles.Temp,'Value');
        BP = get(handles.BPressure,'Value');
        P = get(handles.PulseRate,'Value');
        if G == 1
            BGlucose_Callback(hObject, eventdata, handles)
        elseif H == 1
            Temp_Callback(hObject, eventdata, handles)
        elseif BP == 1
            BPressure_Callback(hObject, eventdata, handles)
        elseif P == 1
            PulseRate_Callback(hObject, eventdata, handles)
        end
        
        
    case 'Fasting / Before Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT * FROM FastingTable');
        set(handles.OverallTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D) && ~isempty(Table)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.OverallTable,'Data',{});
            set(handles.OverallTable,'Data',F);
        end
        
        G = get(handles.BGlucose,'Value');
        H = get(handles.Temp,'Value');
        BP = get(handles.BPressure,'Value');
        P = get(handles.PulseRate,'Value');
        if G == 1
            BGlucose_Callback(hObject, eventdata, handles)
        elseif H == 1
            Temp_Callback(hObject, eventdata, handles)
        elseif BP == 1
            BPressure_Callback(hObject, eventdata, handles)
        elseif P == 1
            PulseRate_Callback(hObject, eventdata, handles)
        end
        
    case 'Two(2) Hours After Meal'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT * FROM AfterMealTable');
        set(handles.OverallTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.OverallTable,'Data',{});
            set(handles.OverallTable,'Data',F);
        end
        
        G = get(handles.BGlucose,'Value');
        H = get(handles.Temp,'Value');
        BP = get(handles.BPressure,'Value');
        P = get(handles.PulseRate,'Value');
        if G == 1
            BGlucose_Callback(hObject, eventdata, handles)
        elseif H == 1
            Temp_Callback(hObject, eventdata, handles)
        elseif BP == 1
            BPressure_Callback(hObject, eventdata, handles)
        elseif P == 1
            PulseRate_Callback(hObject, eventdata, handles)
        end
        
    case 'Overall'
        conn = sqlite(dbfile,'connect');
        Table = fetch(conn,'SELECT * FROM OverallRecordTable');
        set(handles.OverallTable,'Data', Table);
        
        D = get(handles.dates,'String');
        
        if ~isempty(D)
            W = Table;
            X = get(handles.dates,'String');
            Y = split(W(:,1));
            H = find(strcmpi(Y(:,1),X));
            F = W(H,:);
            set(handles.OverallTable,'Data',{});
            set(handles.OverallTable,'Data',F);
        end
        
        G = get(handles.BGlucose,'Value');
        H = get(handles.Temp,'Value');
        BP = get(handles.BPressure,'Value');
        P = get(handles.PulseRate,'Value');
        if G == 1
            BGlucose_Callback(hObject, eventdata, handles)
        elseif H == 1
            Temp_Callback(hObject, eventdata, handles)
        elseif BP == 1
            BPressure_Callback(hObject, eventdata, handles)
        elseif P == 1
            PulseRate_Callback(hObject, eventdata, handles)
        end
        
end


% --- Executes on selection change in Selection.
function Selection2_Callback(hObject, eventdata, handles)
% hObject    handle to Selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Selection contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Selection


% --- Executes during object creation, after setting all properties.
function Selection2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

