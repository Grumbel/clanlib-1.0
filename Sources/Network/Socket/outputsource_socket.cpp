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

#include "API/Network/Socket/outputsource_socket.h"
#include "API/Network/Socket/socket.h"
#include "socket_generic.h"

/////////////////////////////////////////////////////////////////////////////
// CL_OutputSource_Socket Construction:

CL_OutputSource_Socket::CL_OutputSource_Socket(const CL_Socket &sock)
: socket(sock.impl), ref_count_socket(true)
{
	socket->add_ref();
}

CL_OutputSource_Socket::~CL_OutputSource_Socket()
{
	if (ref_count_socket) socket->release_ref();
}

/////////////////////////////////////////////////////////////////////////////
// CL_OutputSource_Socket Attributes:

int CL_OutputSource_Socket::tell() const
{
	return 0;
}

int CL_OutputSource_Socket::size() const
{
	return 0;
}

/////////////////////////////////////////////////////////////////////////////
// CL_OutputSource_Socket Operations:

int CL_OutputSource_Socket::write(const void *data, int size)
{
	CL_Socket s(socket);
	char *d = (char*) data;
	int total_sent = 0;
	while (size-total_sent > 0)
	{
		int sent = s.send(d+total_sent, size-total_sent);
		if (sent <= 0)
			break;

		total_sent += sent;
	}
	return total_sent;
}
	
void CL_OutputSource_Socket::open()
{
}

void CL_OutputSource_Socket::close()
{
}

CL_OutputSource *CL_OutputSource_Socket::clone()
{
	return new CL_OutputSource_Socket(CL_Socket(socket));
}
