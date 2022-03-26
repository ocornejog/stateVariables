function varargout = GRAF_SENIALES_BASICAS(varargin)
% GRAF_SENIALES_BASICAS MATLAB code for GRAF_SENIALES_BASICAS.fig
%      GRAF_SENIALES_BASICAS, by itself, creates a new GRAF_SENIALES_BASICAS or raises the existing
%      singleton*.
%
%      H = GRAF_SENIALES_BASICAS returns the handle to a new GRAF_SENIALES_BASICAS or the handle to
%      the existing singleton*.
%
%      GRAF_SENIALES_BASICAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAF_SENIALES_BASICAS.M with the given input arguments.
%
%      GRAF_SENIALES_BASICAS('Property','Value',...) creates a new GRAF_SENIALES_BASICAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GRAF_SENIALES_BASICAS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GRAF_SENIALES_BASICAS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GRAF_SENIALES_BASICAS

% Last Modified by GUIDE v2.5 10-Sep-2016 20:27:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GRAF_SENIALES_BASICAS_OpeningFcn, ...
                   'gui_OutputFcn',  @GRAF_SENIALES_BASICAS_OutputFcn, ...
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


% --- Executes just before GRAF_SENIALES_BASICAS is made visible.
function GRAF_SENIALES_BASICAS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GRAF_SENIALES_BASICAS (see VARARGIN)

% Choose default command line output for GRAF_SENIALES_BASICAS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GRAF_SENIALES_BASICAS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GRAF_SENIALES_BASICAS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in boton_sumar.
function boton_sumar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_sumar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global esc Lx2 amptx2 tx2i_n tx2i_f tx2i_p tx2i ampx2 x2  x2i_n x2i_f x2i_p x2i kx t0x ax x0 Ly2 ampty2 ty2i_n ty2i_f ty2i_p ty2i ampy2 y2  y2i_n y2i_f y2i_p y2i ky t0y ay y0%se declaran variables globales
syms t %se declaran variables simbolicas

clc %limpia los comandos y posicion anteriores del cursor
axes(handles.grafica_zt)%establece ejes en graficas_x
set(handles.grafica_zt, 'visible', 'on')%establece visibles los ejes de la grafica_x
cla %limpia los ejes 

if tx2i(1)>=ty2i(1) & tx2i(end)>=ty2i(end)
    
    tzi_n=ty2i(1):1/esc:tx2i(1); %puntos negativos para el tiempo
    tzi_f=tx2i(1):1/esc:ty2i(end); %puntos de tiempo para funcion 
    tzi_p=ty2i(end):1/esc:tx2i(end); %puntos positivos para el tiempo
    
    tzi=[tzi_n([1:end-1]),tzi_f([1:end-1]),tzi_p([1:end])]; %vector del tiempo
    
    zi_n=zeros(1,(tx2i(1)-ty2i(1))*esc+1); %puntos negativos para la funcion
    zi_p=zeros(1,(tx2i(end)-ty2i(end))*esc+1); %puntos positivos para la funcion
    zxi=[zi_n([1:end-1]),x2i_n([1:end-1]),x2i_f([1:end-1]),x2i_p([1:end])]; %vector completado para x2(t)
    zyi=[y2i_n([1:end-1]),y2i_f([1:end-1]),y2i_p([1:end-1]),zi_p([1:end])]; %vector completado para y2(t)
    zi=zxi+zyi; %vector de la funcion
    
    amptz=max(tzi)-min(tzi);%amplitud del tiempo
    ampz=max(zi)-min(zi); %amplitud de la funcion z
        
    plot([0 0],[min(zi)-ampz max(zi)+ampz],'black','Linewidth', 1);hold on %grafica del eje y
    plot([tzi(1) tzi(end)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
    plot(tzi,zi,'red','Linewidth', 1.5); hold on %grafica la funcion para un periodo
    xlim([tzi(1) tzi(end)]) %se define el los limites fijos para el eje x
    ylim([min(zi)-ampz max(zi)+ampz])  %se define el los limites fijos para el eje y
    grid on%pone cuadriculas a la grafica
    xlabel('TIEMPO'); %titulo del eje x
    ylabel('MAGNITUD'); %titulo del eje y
    title('z(t)','FontName','Cambria','FontSize',12); %titulo del grafico
    
elseif tx2i(1)<=ty2i(1) & tx2i(end)<=ty2i(end)
   
    tzi_n=tx2i(1):1/esc:ty2i(1); %puntos negativos para el tiempo
    tzi_f=ty2i(1):1/esc:tx2i(end); %puntos de tiempo para funcion 
    tzi_p=tx2i(end):1/esc:ty2i(end); %puntos positivos para el tiempo
    
    tzi=[tzi_n([1:end-1]),tzi_f([1:end-1]),tzi_p([1:end])]; %vector del tiempo
    
    zi_n=zeros(1,(ty2i(1)-tx2i(1))*esc+1); %puntos negativos para la funcion
    zi_p=zeros(1,(ty2i(end)-tx2i(end))*esc+1); %puntos positivos para la funcion
    zxi=[x2i_n([1:end-1]),x2i_f([1:end-1]),x2i_p([1:end-1]),zi_p([1:end])]; %vector completado para x2(t)
    zyi=[zi_n([1:end-1]),y2i_n([1:end-1]),y2i_f([1:end-1]),y2i_p([1:end])]; %vector completado para y2(t)
    zi=zxi+zyi; %vector de la funcion
    
    amptz=max(tzi)-min(tzi);%amplitud del tiempo
    ampz=max(zi)-min(zi); %amplitud de la funcion z
        
    plot([0 0],[min(zi)-ampz max(zi)+ampz],'black','Linewidth', 1);hold on %grafica del eje y
    plot([tzi(1) tzi(end)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
    plot(tzi,zi,'red','Linewidth', 1.5); hold on %grafica la funcion para un periodo
    xlim([tzi(1) tzi(end)]) %se define el los limites fijos para el eje x
    ylim([min(zi)-ampz max(zi)+ampz])  %se define el los limites fijos para el eje y
    grid on%pone cuadriculas a la grafica
    xlabel('TIEMPO'); %titulo del eje x
    ylabel('MAGNITUD'); %titulo del eje y
    title('z(t)','FontName','Cambria','FontSize',12); %titulo del grafico
  
elseif tx2i(1)<=ty2i(1) & ty2i(end)<=tx2i(end)
    
    tzi_n=tx2i(1):1/esc:ty2i(1); %puntos negativos para el tiempo
    tzi_f=ty2i(1):1/esc:ty2i(end); %puntos de tiempo para funcion 
    tzi_p=ty2i(end):1/esc:tx2i(end); %puntos positivos para el tiempo
    
    tzi=[tzi_n([1:end-1]),tzi_f([1:end-1]),tzi_p([1:end])]; %vector del tiempo
    
    zi_n=zeros(1,(ty2i(1)-tx2i(1))*esc+1); %puntos negativos para la funcion
    zi_p=zeros(1,(tx2i(end)-ty2i(end))*esc+1); %puntos positivos para la funcion
    zxi=[x2i_n([1:end-1]),x2i_f([1:end-1]),x2i_p([1:end])]; %vector completado para x2(t)
    zyi=[zi_n([1:end-1]),y2i_n([1:end-1]),y2i_f([1:end-1]),y2i_p([1:end-1]),zi_p([1:end])]; %vector completado para y2(t)
    zi=zxi+zyi; %vector de la funcion
    
    amptz=max(tzi)-min(tzi);%amplitud del tiempo
    ampz=max(zi)-min(zi); %amplitud de la funcion z
        
    plot([0 0],[min(zi)-ampz max(zi)+ampz],'black','Linewidth', 1);hold on %grafica del eje y
    plot([tzi(1) tzi(end)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
    plot(tzi,zi,'red','Linewidth', 1.5); hold on %grafica la funcion para un periodo
    xlim([tzi(1) tzi(end)]) %se define el los limites fijos para el eje x
    ylim([min(zi)-ampz max(zi)+ampz])  %se define el los limites fijos para el eje y
    grid on%pone cuadriculas a la grafica
    xlabel('TIEMPO'); %titulo del eje x
    ylabel('MAGNITUD'); %titulo del eje y
    title('z(t)','FontName','Cambria','FontSize',12); %titulo del grafico

elseif tx2i(1)>=ty2i(1) & ty2i(end)>=tx2i(end)
    
    tzi_n=ty2i(1):1/esc:tx2i(1); %puntos negativos para el tiempo
    tzi_f=tx2i(1):1/esc:tx2i(end); %puntos de tiempo para funcion 
    tzi_p=tx2i(end):1/esc:ty2i(end); %puntos positivos para el tiempo
    
    tzi=[tzi_n([1:end-1]),tzi_f([1:end-1]),tzi_p([1:end])]; %vector del tiempo
    
    zi_n=zeros(1,(tx2i(1)-ty2i(1))*esc+1); %puntos negativos para la funcion
    zi_p=zeros(1,(ty2i(end)-tx2i(end))*esc+1); %puntos positivos para la funcion
    zxi=[zi_n([1:end-1]),x2i_n([1:end-1]),x2i_f([1:end-1]),x2i_p([1:end-1]),zi_p([1:end])]; %vector completado para y2(t)
    zyi=[y2i_n([1:end-1]),y2i_f([1:end-1]),y2i_p([1:end])]; %vector completado para x2(t)
    zi=zxi+zyi; %vector de la funcion
    
    amptz=max(tzi)-min(tzi);%amplitud del tiempo
    ampz=max(zi)-min(zi); %amplitud de la funcion z
        
    plot([0 0],[min(zi)-ampz max(zi)+ampz],'black','Linewidth', 1);hold on %grafica del eje y
    plot([tzi(1) tzi(end)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
    plot(tzi,zi,'red','Linewidth', 1.5); hold on %grafica la funcion para un periodo
    xlim([tzi(1) tzi(end)]) %se define el los limites fijos para el eje x
    ylim([min(zi)-ampz max(zi)+ampz])  %se define el los limites fijos para el eje y
    grid on%pone cuadriculas a la grafica
    xlabel('TIEMPO'); %titulo del eje x
    ylabel('MAGNITUD'); %titulo del eje y
    title('z(t)','FontName','Cambria','FontSize',12); %titulo del grafico
    
end

guidata(hObject, handles);

% --- Executes on button press in boton_graficary.
function boton_graficary_Callback(hObject, eventdata, handles)
% hObject    handle to boton_graficary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ity iy esc Ly ampty tyi_n tyi_f tyi_p tyi ampy y  yi_n yi_f yi_p yi %se declaran variables globales
syms t %se declaran variables simbolicas

clc %limpia los comandos y posicion anteriores del cursor
axes(handles.grafica_y)%establece ejes en graficas_y
set(handles.grafica_y, 'visible', 'on')%establece visibles los ejes de la grafica_y
cla %limpia los ejes 
iy=1;
ity=1;
esc=100;%establecemos la escala
Ly(1) = str2num(get(handles.editor_linfy, 'String'));%se obtiene el limite inferior de la funcion y(t)
Ly(2) = str2num(get(handles.editor_lsupy, 'String'));%se obtiene el limite superior de la funcion y(t)


ampty=max(Ly)-min(Ly); %calculamos la amplitud del tiempo 
tyi_n=(min(Ly)-ampty):1/esc:min(Ly); %valores negativos para el tiempo
tyi_f =min(Ly):1/esc:max(Ly); %valores de tiempo para la funcion
tyi_p=max(Ly):1/esc:(max(Ly)+ampty);%valores positivos para el tiempo
tyi=[tyi_n,tyi_f,tyi_p]; %vector del tiempo

y = eval(get(handles.editor_yt, 'String'));%se obtiene la ecuacion y se le asigna a y(t)
yi_n=zeros(1,ampty*esc+1); %valores negativos para la funcion
yi_f =eval(subs(y,tyi_f));%reemplaza los valores de tyi_f en la ecuacion y  
yi_p=zeros(1,ampty*esc+1); %valores positivos para la funcion
yi=[yi_n,yi_f,yi_p]; %vector de la funcion

ampy=max(yi)-min(yi); %calculamos la amplitud de la funcion

plot([0 0],[min(yi)-ampy max(yi)+ampy],'black','Linewidth', 1);hold on %grafica del eje y
plot([tyi(1) tyi(end)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
plot(tyi,yi,'green','Linewidth', 1.5); hold on %grafica la funcion
xlim([tyi(1) tyi(end)]) %se define el los limites fijos para el eje x
ylim([min(yi)-ampy max(yi)+ampy])  %se define el los limites fijos para el eje y
grid on%pone cuadriculas a la grafica
xlabel('TIEMPO'); %titulo del eje x
ylabel('AMPLITUD'); %titulo del eje y
title('y(t)','FontName','Cambria','FontSize',12); %titulo del grafico

guidata(hObject, handles);

function editor_lsupy_Callback(hObject, eventdata, handles)
% hObject    handle to editor_lsupy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_lsupy as text
%        str2double(get(hObject,'String')) returns contents of editor_lsupy as a double


% --- Executes during object creation, after setting all properties.
function editor_lsupy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_lsupy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editor_linfy_Callback(hObject, eventdata, handles)
% hObject    handle to editor_linfy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_linfy as text
%        str2double(get(hObject,'String')) returns contents of editor_linfy as a double


% --- Executes during object creation, after setting all properties.
function editor_linfy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_linfy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editor_yt_Callback(hObject, eventdata, handles)
% hObject    handle to editor_yt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_yt as text
%        str2double(get(hObject,'String')) returns contents of editor_yt as a double


% --- Executes during object creation, after setting all properties.
function editor_yt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_yt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editor_xt_Callback(hObject, eventdata, handles)
% hObject    handle to editor_xt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_xt as text
%        str2double(get(hObject,'String')) returns contents of editor_xt as a double


% --- Executes during object creation, after setting all properties.
function editor_xt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_xt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editor_linfx_Callback(hObject, eventdata, handles)
% hObject    handle to editor_linfx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_linfx as text
%        str2double(get(hObject,'String')) returns contents of editor_linfx as a double


% --- Executes during object creation, after setting all properties.
function editor_linfx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_linfx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editor_lsupx_Callback(hObject, eventdata, handles)
% hObject    handle to editor_lsupx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_lsupx as text
%        str2double(get(hObject,'String')) returns contents of editor_lsupx as a double


% --- Executes during object creation, after setting all properties.
function editor_lsupx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_lsupx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_graficarx.
function boton_graficarx_Callback(hObject, eventdata, handles)
% hObject    handle to boton_graficarx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ix itx esc Lx amptx txi_n txi_f txi_p txi ampx x  xi_n xi_f xi_p xi %se declaran variables globales
syms t %se declaran variables simbolicas

clc %limpia los comandos y posicion anteriores del cursor
axes(handles.grafica_x)%establece ejes en graficas_x
set(handles.grafica_x, 'visible', 'on')%establece visibles los ejes de la grafica_x
cla %limpia los ejes 
ix=1;
itx=1;
esc=100;%establecemos la escala
Lx(1) = str2num(get(handles.editor_linfx, 'String'));%se obtiene el limite inferior de la funcion x(t)
Lx(2) = str2num(get(handles.editor_lsupx, 'String'));%se obtiene el limite superior de la funcion x(t)


amptx=max(Lx)-min(Lx); %calculamos la amplitud del tiempo 
txi_n=(min(Lx)-amptx):1/esc:min(Lx); %valores negativos para el tiempo
txi_f =min(Lx):1/esc:max(Lx); %valores de tiempo para la funcion
txi_p=max(Lx):1/esc:(max(Lx)+amptx);%valores positivos para el tiempo
txi=[txi_n,txi_f,txi_p]; %vector del tiempo

x = eval(get(handles.editor_xt, 'String'));%se obtiene la ecuacion y se le asigna a x(t)
xi_n=zeros(1,amptx*esc+1); %valores negativos para la funcion
xi_f =eval(subs(x,txi_f));%reemplaza los valores de txi_f en la ecuacion x  
xi_p=zeros(1,amptx*esc+1); %valores positivos para la funcion
xi=[xi_n,xi_f,xi_p]; %vector de la funcion

ampx=max(xi)-min(xi); %calculamos la amplitud de la funcion

plot([0 0],[min(xi)-ampx max(xi)+ampx],'black','Linewidth', 1);hold on %grafica del eje y
plot([txi(1) txi(end)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
plot(txi,xi,'blue','Linewidth', 1.5); hold on %grafica la funcion
xlim([txi(1) txi(end)]) %se define el los limites fijos para el eje x
ylim([min(xi)-ampx max(xi)+ampx])  %se define el los limites fijos para el eje y
grid on%pone cuadriculas a la grafica
xlabel('TIEMPO'); %titulo del eje x
ylabel('MAGNITUD'); %titulo del eje y
title('x(t)','FontName','Cambria','FontSize',12); %titulo del grafico

guidata(hObject, handles);

function editor_ax_Callback(hObject, eventdata, handles)
% hObject    handle to editor_ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_ax as text
%        str2double(get(hObject,'String')) returns contents of editor_ax as a double


% --- Executes during object creation, after setting all properties.
function editor_ax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_ax.
function boton_ax_Callback(hObject, eventdata, handles)
% hObject    handle to boton_ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global esc Lx x tx_i x_i ampx amptx ampx2 amptx2 txi xi txi_n txi_p xi_n xi_p x2i tx2i ctrl %se declaran variables globales
syms txi t k %se declaran variables simbolicas

clc %limpia los comandos y posicion anteriores del cursor
axes(handles.grafica_xt2)%establece ejes en graficas_x
set(handles.grafica_xt2, 'visible', 'on')%establece visibles los ejes de la grafica_x
cla %limpia los ejes 
kx=str2num(get(handles.editor_kx, 'String'));
t0x=str2num(get(handles.editor_t0x, 'String'));
ax=str2num(get(handles.editor_ax, 'String'));
x0=str2num(get(handles.editor_x0, 'String'));
tx2i=kx*(tx_i+t0x);
amptx2=abs(kx)*amptx;
x2i=ax*(x_i+x0);
ampx2=abs(ax)*ampx;
plot([0 0],[min(x2i)-ampx2 max(x2i)+ampx2],'black','Linewidth', 1);hold on %grafica del eje y
plot([min(tx2i) max(tx2i)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
plot(tx2i,x2i,'blue','Linewidth', 1.5); hold on %grafica la funcion para un periodo
xlim([min(tx2i) max(tx2i)]) %se define el los limites fijos para el eje x
ylim([min(x2i)-ampx2 max(x2i)+ampx2])  %se define el los limites fijos para el eje y
grid on%pone cuadriculas a la grafica
xlabel('TIEMPO'); %titulo del eje x
ylabel('MAGNITUD'); %titulo del eje y
title('a*(x(k(t-t0))+x0)','FontName','Cambria','FontSize',12); %titulo del grafico


function editor_x0_Callback(hObject, eventdata, handles)
% hObject    handle to editor_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_x0 as text
%        str2double(get(hObject,'String')) returns contents of editor_x0 as a double


% --- Executes during object creation, after setting all properties.
function editor_x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_x0.
function boton_x0_Callback(hObject, eventdata, handles)
% hObject    handle to boton_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global esc Lx x tx_i x_i ampx amptx ampx2 amptx2 txi xi txi_n txi_p xi_n xi_p x2i tx2i ctrl %se declaran variables globales
syms txi t k %se declaran variables simbolicas

clc %limpia los comandos y posicion anteriores del cursor
axes(handles.grafica_xt2)%establece ejes en graficas_x
set(handles.grafica_xt2, 'visible', 'on')%establece visibles los ejes de la grafica_x
cla %limpia los ejes 
kx=str2num(get(handles.editor_kx, 'String'));
t0x=str2num(get(handles.editor_t0x, 'String'));
ax=str2num(get(handles.editor_ax, 'String'));
x0=str2num(get(handles.editor_x0, 'String'));
tx2i=kx*(tx_i+t0x);
amptx2=abs(kx)*amptx;
x2i=ax*(x_i+x0);
ampx2=abs(ax)*ampx;
plot([0 0],[min(x2i)-ampx2 max(x2i)+ampx2],'black','Linewidth', 1);hold on %grafica del eje y
plot([min(tx2i) max(tx2i)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
plot(tx2i,x2i,'blue','Linewidth', 1.5); hold on %grafica la funcion para un periodo
xlim([min(tx2i) max(tx2i)]) %se define el los limites fijos para el eje x
ylim([min(x2i)-ampx2 max(x2i)+ampx2])  %se define el los limites fijos para el eje y
grid on%pone cuadriculas a la grafica
xlabel('TIEMPO'); %titulo del eje x
ylabel('MAGNITUD'); %titulo del eje y
title('a*(x(k(t-t0))+x0)','FontName','Cambria','FontSize',12); %titulo del grafico

function editor_kx_Callback(hObject, eventdata, handles)
% hObject    handle to editor_kx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_kx as text
%        str2double(get(hObject,'String')) returns contents of editor_kx as a double


% --- Executes during object creation, after setting all properties.
function editor_kx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_kx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_kx.
function boton_kx_Callback(hObject, eventdata, handles)
% hObject    handle to boton_kx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global esc Lx x tx_i x_i ampx amptx ampx2 amptx2 txi xi txi_n txi_p xi_n xi_p x2i tx2i ctrl %se declaran variables globales
syms txi t k %se declaran variables simbolicas

clc %limpia los comandos y posicion anteriores del cursor
axes(handles.grafica_xt2)%establece ejes en graficas_x
set(handles.grafica_xt2, 'visible', 'on')%establece visibles los ejes de la grafica_x
cla %limpia los ejes 
kx=str2num(get(handles.editor_kx, 'String'));
t0x=str2num(get(handles.editor_t0x, 'String'));
ax=str2num(get(handles.editor_ax, 'String'));
x0=str2num(get(handles.editor_x0, 'String'));
tx2i=kx*(tx_i+t0x);
amptx2=abs(kx)*amptx;
x2i=ax*(x_i+x0);
ampx2=abs(ax)*ampx;
plot([0 0],[min(x2i)-ampx2 max(x2i)+ampx2],'black','Linewidth', 1);hold on %grafica del eje y
plot([min(tx2i) max(tx2i)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
plot(tx2i,x2i,'blue','Linewidth', 1.5); hold on %grafica la funcion para un periodo
xlim([min(tx2i) max(tx2i)]) %se define el los limites fijos para el eje x
ylim([min(x2i)-ampx2 max(x2i)+ampx2])  %se define el los limites fijos para el eje y
grid on%pone cuadriculas a la grafica
xlabel('TIEMPO'); %titulo del eje x
ylabel('MAGNITUD'); %titulo del eje y
title('a*(x(k(t-t0))+x0)','FontName','Cambria','FontSize',12); %titulo del grafico


function editor_t0x_Callback(hObject, eventdata, handles)
% hObject    handle to editor_t0x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_t0x as text
%        str2double(get(hObject,'String')) returns contents of editor_t0x as a double


% --- Executes during object creation, after setting all properties.
function editor_t0x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_t0x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_t0x.
function boton_t0x_Callback(hObject, eventdata, handles)
% hObject    handle to boton_t0x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global esc ix itx Lx2 amptx2 tx2i_n tx2i_f tx2i_p tx2i ampx2 x2  x2i_n x2i_f x2i_p x2i kx t0x ax x0 %se declaran variables globales
syms t %se declaran variables simbolicas

clc %limpia los comandos y posicion anteriores del cursor
axes(handles.grafica_xt2)%establece ejes en graficas_x
set(handles.grafica_xt2, 'visible', 'on')%establece visibles los ejes de la grafica_x
cla %limpia los ejes 

t0x=str2num(get(handles.editor_t0x, 'String')); %desplazamiento en el tiempo
kx=itx*str2num(get(handles.editor_kx, 'String')); %escalamiento en el tiempo
x0=str2num(get(handles.editor_x0, 'String')); %desplazamiento en amplitud
ax=ix*str2num(get(handles.editor_ax, 'String')); %escalamiento en amplitud

esc=100; %establecemos la escala
Lx2(1) = str2num(get(handles.editor_linfx, 'String'))/kx; %se obtiene el limite inferior de la funcion x2(t)
Lx2(2) = str2num(get(handles.editor_lsupx, 'String'))/kx; %se obtiene el limite superior de la funcion x2(t)

amptx2=max(Lx2)-min(Lx2); %calculamos la amplitud del tiempo 
tx2i_n=((min(Lx2)-amptx2):1/esc:min(Lx2))+t0x; %valores negativos para el tiempo
tx2i_f=(min(Lx2):1/esc:max(Lx2))+t0x; %valores de tiempo para la funcion
tx2i_p=(max(Lx2):1/esc:(max(Lx2)+amptx2))+t0x; %valores positivos para el tiempo
tx2i=[tx2i_n,tx2i_f,tx2i_p]; %vector del tiempo

x2 = eval(get(handles.editor_xt, 'String')); %se obtiene la ecuacion y se le asigna a x2(t)
x2=eval(ax*subs(x2,kx*(t-t0x))+x0) %se le aplican los parametros a x2

x2i_n=zeros(1,length(tx2i_n)); %valores negativos para la funcion
x2i_f =eval(subs(x2,tx2i_f)); %reemplaza los valores de tx2i_f en la ecuacion x2  
x2i_p=zeros(1,length(tx2i_p)); %valores positivos para la funcion
x2i=[x2i_n,x2i_f,x2i_p]; %vector de la funcion

ampx2=max(x2i)-min(x2i); %calculamos la amplitud de la funcion

plot([0 0],[min(x2i)-ampx2 max(x2i)+ampx2],'black','Linewidth', 1);hold on %grafica del eje y
plot([tx2i(1) tx2i(end)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
plot(tx2i,x2i,'blue','Linewidth', 1.5); hold on %grafica la funcion
xlim([tx2i(1) tx2i(end)]) %se define el los limites fijos para el eje x
ylim([min(x2i)-ampx2 max(x2i)+ampx2])  %se define el los limites fijos para el eje y
grid on%pone cuadriculas a la grafica
xlabel('TIEMPO'); %titulo del eje x
ylabel('MAGNITUD'); %titulo del eje y
title('x_2(t)','FontName','Cambria','FontSize',12); %titulo del grafico

guidata(hObject, handles);

function editor_ky_Callback(hObject, eventdata, handles)
% hObject    handle to editor_ky (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_ky as text
%        str2double(get(hObject,'String')) returns contents of editor_ky as a double


% --- Executes during object creation, after setting all properties.
function editor_ky_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_ky (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_ky.
function boton_ky_Callback(hObject, eventdata, handles)
% hObject    handle to boton_ky (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function editor_t0y_Callback(hObject, eventdata, handles)
% hObject    handle to editor_t0y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_t0y as text
%        str2double(get(hObject,'String')) returns contents of editor_t0y as a double


% --- Executes during object creation, after setting all properties.
function editor_t0y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_t0y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_t0y.
function boton_t0y_Callback(hObject, eventdata, handles)
% hObject    handle to boton_t0y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global esc ity iy Ly2 ampty2 ty2i_n ty2i_f ty2i_p ty2i ampy2 y2  y2i_n y2i_f y2i_p y2i ky t0y ay y0 %se declaran variables globales
syms t %se declaran variables simbolicas

clc %limpia los comandos y posicion anteriores del cursor
axes(handles.grafica_yt2)%establece ejes en graficas_y
set(handles.grafica_yt2, 'visible', 'on')%establece visibles los ejes de la grafica_y
cla %limpia los ejes 

t0y=str2num(get(handles.editor_t0y, 'String')); %desplazamiento en el tiempo
ky=ity*str2num(get(handles.editor_ky, 'String')); %escalamiento en el tiempo
y0=str2num(get(handles.editor_y0, 'String')); %desplazamiento en amplitud
ay=iy*str2num(get(handles.editor_ay, 'String')); %escalamiento en amplitud

esc=100;%establecemos la escala
Ly2(1) = str2num(get(handles.editor_linfy, 'String'))/ky;%se obtiene el limite inferior de la funcion y2(t)
Ly2(2) = str2num(get(handles.editor_lsupy, 'String'))/ky;%se obtiene el limite superior de la funcion y2(t)

ampty2=max(Ly2)-min(Ly2); %calculamos la amplitud del tiempo 
ty2i_n=((min(Ly2)-ampty2):1/esc:min(Ly2))+t0y; %valores negativos para el tiempo
ty2i_f =(min(Ly2):1/esc:max(Ly2))+t0y; %valores de tiempo para la funcion
ty2i_p=(max(Ly2):1/esc:(max(Ly2)+ampty2))+t0y;%valores positivos para el tiempo
ty2i=[ty2i_n,ty2i_f,ty2i_p]; %vector del tiempo

y2 = eval(get(handles.editor_yt, 'String'));%se obtiene la ecuacion y se le asigna a y2(t)
y2=eval(ay*subs(y2,ky*(t-t0y))+y0)%se le aplican los parametros a y2

y2i_n=zeros(1,length(ty2i_n)); %valores negativos para la funcion
y2i_f =eval(subs(y2,ty2i_f));%reemplaza los valores de ty2i_f en la ecuacion y2  
y2i_p=zeros(1,length(ty2i_n)); %valores positivos para la funcion
y2i=[y2i_n,y2i_f,y2i_p]; %vector de la funcion

ampy2=max(y2i)-min(y2i); %calculamos la amplitud de la funcion

plot([0 0],[min(y2i)-ampy2 max(y2i)+ampy2],'black','Linewidth', 1);hold on %grafica del eje y
plot([ty2i(1) ty2i(end)],[0 0],'black','Linewidth', 1);hold on %grafica del eje x
plot(ty2i,y2i,'green','Linewidth', 1.5); hold on %grafica la funcion
xlim([ty2i(1) ty2i(end)]) %se define el los limites fijos para el eje x
ylim([min(y2i)-ampy2 max(y2i)+ampy2])  %se define el los limites fijos para el eje y
grid on%pone cuadriculas a la grafica
xlabel('TIEMPO'); %titulo del eje x
ylabel('MAGNITUD'); %titulo del eje y
title('y_2(t)','FontName','Cambria','FontSize',12); %titulo del grafico

guidata(hObject, handles);

function editor_ay_Callback(hObject, eventdata, handles)
% hObject    handle to editor_ay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_ay as text
%        str2double(get(hObject,'String')) returns contents of editor_ay as a double


% --- Executes during object creation, after setting all properties.
function editor_ay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_ay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_ay.
function boton_ay_Callback(hObject, eventdata, handles)
% hObject    handle to boton_ay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function editor_y0_Callback(hObject, eventdata, handles)
% hObject    handle to editor_y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_y0 as text
%        str2double(get(hObject,'String')) returns contents of editor_y0 as a double


% --- Executes during object creation, after setting all properties.
function editor_y0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_y0.
function boton_y0_Callback(hObject, eventdata, handles)
% hObject    handle to boton_y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in boton_inv.
function boton_inv_Callback(hObject, eventdata, handles)
% hObject    handle to boton_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ix
button_state=get(hObject,'Value');
if button_state==get(hObject,'Max');
    ix=-1;
elseif button_state==get(hObject,'Min');
    ix=1;
end

% --- Executes on button press in boton_invtx.
function boton_invtx_Callback(hObject, eventdata, handles)
% hObject    handle to boton_invtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global itx
button_state=get(hObject,'Value');
if button_state==get(hObject,'Max');
    itx=-1;
elseif button_state==get(hObject,'Min');
    itx=1;
end


% --- Executes on button press in boton_invty.
function boton_invty_Callback(hObject, eventdata, handles)
% hObject    handle to boton_invty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ity
button_state=get(hObject,'Value');
if button_state==get(hObject,'Max');
    ity=-1;
elseif button_state==get(hObject,'Min');
    ity=1;
end
% Hint: get(hObject,'Value') returns toggle state of boton_invty


% --- Executes on button press in boton_invy.
function boton_invy_Callback(hObject, eventdata, handles)
% hObject    handle to boton_invy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global iy
button_state=get(hObject,'Value');
if button_state==get(hObject,'Max');
    iy=-1;
elseif button_state==get(hObject,'Min');
    iy=1;
end
% Hint: get(hObject,'Value') returns toggle state of boton_invy


% --- Executes on button press in boton_mul.
function boton_mul_Callback(hObject, eventdata, handles)
% hObject    handle to boton_mul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in boton_integrar.
function boton_integrar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_integrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
