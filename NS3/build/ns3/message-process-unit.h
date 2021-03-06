/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2013,2014 TELEMATICS LAB, DEI - Politecnico di Bari
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation;
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Author: Giuseppe Piro <peppe@giuseppepiro.com>, <g.piro@poliba.it>
 */

#ifndef MESSAGE_PROCESS_UNIT_H
#define MESSAGE_PROCESS_UNIT_H

#include "ns3/object.h"
#include "ns3/packet.h"
#include "nano-mac-entity.h"
#include <fstream>

namespace ns3 {

	class SimpleNanoDevice;

	/**
	 * \ingroup nanonetworks
	 *
	 * This class provides
	 */
	class MessageProcessUnit : public Object
	{
		public:
			static TypeId GetTypeId (void);

			MessageProcessUnit (void);
			virtual ~MessageProcessUnit (void);

			virtual void DoDispose (void);

			void SetDevice (Ptr<SimpleNanoDevice> d);
			Ptr<SimpleNanoDevice> GetDevice (void);

			void CreteMessage ();
			void CreateGatewaytestMessage();			//flow-guided
			void ComputeAverageIndex ();			//flow-guided
			void ProcessMessage (Ptr<Packet> p);

		private:
			Ptr<SimpleNanoDevice> m_device;

		public:
			std::string txLogName;				//数据包接收输出日志名称
			std::ofstream osTx;
			std::string rxLogName;				//数据包接收输出日志名称
			std::ofstream osRx;
	};
} // namespace ns3

#endif /* MESSAGE_PROCESS_UNIT_H */
