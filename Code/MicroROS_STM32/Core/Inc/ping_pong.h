/*
 * ping_pong.h
 *
 *  Created on: Aug 23, 2025
 *      Author: exysta
 */

#ifndef INC_PING_PONG_H_
#define INC_PING_PONG_H_

#include <rcl/rcl.h>
#include <rclc/rclc.h>
#include <rclc/executor.h>

// Public API
void ping_pong_init(rcl_node_t *node, rclc_executor_t *executor);
void ping_pong_publish_ping(void);


#endif /* INC_PING_PONG_H_ */
