/*
**  ClanLib SDK
**  Copyright (c) 1997-2005 The ClanLib Team
**
**  This software is provided 'as-is', without any express or implied
**  warranty.  In no event will the authors be held liable for any damages
**  arising from the use of this software.
**
**  Permission is granted to anyone to use this software for any purpose,
**  including commercial applications, and to alter it and redistribute it
**  freely, subject to the following restrictions:
**
**  1. The origin of this software must not be misrepresented; you must not
**     claim that you wrote the original software. If you use this software
**     in a product, an acknowledgment in the product documentation would be
**     appreciated but is not required.
**  2. Altered source versions must be plainly marked as such, and must not be
**     misrepresented as being the original software.
**  3. This notice may not be removed or altered from any source distribution.
**
**  Note: Some of the libraries ClanLib may link to may have additional
**  requirements or restrictions.
**
**  File Author(s):
**
**    Magnus Norddahl
**    (if your name is missing here, please add it)
*/

#ifndef header_input_device_sdlmouse
#define header_input_device_sdlmouse

#if _MSC_VER > 1000
#pragma once
#endif

#include "Display/input_device_generic.h"
#include "API/signals.h"
#include "API/Core/Math/point.h"

#include <SDL/SDL.h>

class CL_DisplayWindow_SDL;

class CL_InputDevice_SDLMouse : public CL_InputDevice_Generic
{
//!Construction:
public:
	CL_InputDevice_SDLMouse(CL_DisplayWindow_SDL *owner);

	virtual ~CL_InputDevice_SDLMouse();

//!Attributes:
public:
	//: Returns the x position of the device.
	virtual int get_x() const;

	//: Returns the y position of the device.
	virtual int get_y() const;

	//: Returns true if the passed key code is down for this device.
	virtual bool get_keycode(int keycode) const;

	//: Returns the the current position of a joystick axis.
	virtual float get_axis(int index) const;

	//: Returns the name of the device (i.e. 'Microsoft Sidewinder 3D').
	virtual std::string get_name() const;

	//: Returns the number of axes available on this device.
	virtual int get_axis_count() const;

	//: Returns the number of buttons available on this device.
	//- <p>If used on a keyboard, this function returns -1.</p>
	virtual int get_button_count() const;

//!Operations:
public:
	//: Key name for specified identifier (A, B, C, Space, Enter, Backspace).
	virtual std::string get_key_name(int id) const;
	virtual void handle_mouse_event(SDL_Event&);

//!Implementation:
private:
	CL_DisplayWindow_SDL *owner;

	CL_Slot slot_sdlevent;

	CL_Point mouse_pos;
	bool key_states[5];
};

#endif
