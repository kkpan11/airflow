/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
*/

MERGE INTO YAMMER_GROUPS_ACTIVITY_DETAIL WITH (ROWLOCK) AS target
            USING (SELECT %s AS ReportRefreshDate, %s AS UserId, %s AS UserPrincipalName, %s AS LastActivityDate, %s AS IsDeleted, %s AS DeletedDate, %s AS AssignedProducts, %s AS TeamChatMessageCount, %s AS PrivateChatMessageCount, %s AS CallCount, %s AS MeetingCount, %s AS MeetingsOrganizedCount, %s AS MeetingsAttendedCount, %s AS AdHocMeetingsOrganizedCount, %s AS AdHocMeetingsAttendedCount, %s AS ScheduledOne-timeMeetingsOrganizedCount, %s AS ScheduledOne-timeMeetingsAttendedCount, %s AS ScheduledRecurringMeetingsOrganizedCount, %s AS ScheduledRecurringMeetingsAttendedCount, %s AS AudioDuration, %s AS VideoDuration, %s AS ScreenShareDuration, %s AS AudioDurationInSeconds, %s AS VideoDurationInSeconds, %s AS ScreenShareDurationInSeconds, %s AS HasOtherAction, %s AS UrgentMessages, %s AS PostMessages, %s AS TenantDisplayName, %s AS SharedChannelTenantDisplayNames, %s AS ReplyMessages, %s AS IsLicensed, %s AS ReportPeriod, %s AS LoadDate) AS source
            ON target.GroupDisplayName = source.GroupDisplayName AND target.OwnerPrincipalName = source.OwnerPrincipalName AND target.ReportPeriod = source.ReportPeriod AND target.ReportRefreshDate = source.ReportRefreshDate
            WHEN MATCHED THEN
                UPDATE SET target.UserId = source.UserId, target.UserPrincipalName = source.UserPrincipalName, target.LastActivityDate = source.LastActivityDate, target.IsDeleted = source.IsDeleted, target.DeletedDate = source.DeletedDate, target.AssignedProducts = source.AssignedProducts, target.TeamChatMessageCount = source.TeamChatMessageCount, target.PrivateChatMessageCount = source.PrivateChatMessageCount, target.CallCount = source.CallCount, target.MeetingCount = source.MeetingCount, target.MeetingsOrganizedCount = source.MeetingsOrganizedCount, target.MeetingsAttendedCount = source.MeetingsAttendedCount, target.AdHocMeetingsOrganizedCount = source.AdHocMeetingsOrganizedCount, target.AdHocMeetingsAttendedCount = source.AdHocMeetingsAttendedCount, target.ScheduledOne-timeMeetingsOrganizedCount = source.ScheduledOne-timeMeetingsOrganizedCount, target.ScheduledOne-timeMeetingsAttendedCount = source.ScheduledOne-timeMeetingsAttendedCount, target.ScheduledRecurringMeetingsOrganizedCount = source.ScheduledRecurringMeetingsOrganizedCount, target.ScheduledRecurringMeetingsAttendedCount = source.ScheduledRecurringMeetingsAttendedCount, target.AudioDuration = source.AudioDuration, target.VideoDuration = source.VideoDuration, target.ScreenShareDuration = source.ScreenShareDuration, target.AudioDurationInSeconds = source.AudioDurationInSeconds, target.VideoDurationInSeconds = source.VideoDurationInSeconds, target.ScreenShareDurationInSeconds = source.ScreenShareDurationInSeconds, target.HasOtherAction = source.HasOtherAction, target.UrgentMessages = source.UrgentMessages, target.PostMessages = source.PostMessages, target.TenantDisplayName = source.TenantDisplayName, target.SharedChannelTenantDisplayNames = source.SharedChannelTenantDisplayNames, target.ReplyMessages = source.ReplyMessages, target.IsLicensed = source.IsLicensed, target.LoadDate = source.LoadDate
            WHEN NOT MATCHED THEN
                INSERT (ReportRefreshDate, UserId, UserPrincipalName, LastActivityDate, IsDeleted, DeletedDate, AssignedProducts, TeamChatMessageCount, PrivateChatMessageCount, CallCount, MeetingCount, MeetingsOrganizedCount, MeetingsAttendedCount, AdHocMeetingsOrganizedCount, AdHocMeetingsAttendedCount, ScheduledOne-timeMeetingsOrganizedCount, ScheduledOne-timeMeetingsAttendedCount, ScheduledRecurringMeetingsOrganizedCount, ScheduledRecurringMeetingsAttendedCount, AudioDuration, VideoDuration, ScreenShareDuration, AudioDurationInSeconds, VideoDurationInSeconds, ScreenShareDurationInSeconds, HasOtherAction, UrgentMessages, PostMessages, TenantDisplayName, SharedChannelTenantDisplayNames, ReplyMessages, IsLicensed, ReportPeriod, LoadDate) VALUES (source.ReportRefreshDate, source.UserId, source.UserPrincipalName, source.LastActivityDate, source.IsDeleted, source.DeletedDate, source.AssignedProducts, source.TeamChatMessageCount, source.PrivateChatMessageCount, source.CallCount, source.MeetingCount, source.MeetingsOrganizedCount, source.MeetingsAttendedCount, source.AdHocMeetingsOrganizedCount, source.AdHocMeetingsAttendedCount, source.ScheduledOne-timeMeetingsOrganizedCount, source.ScheduledOne-timeMeetingsAttendedCount, source.ScheduledRecurringMeetingsOrganizedCount, source.ScheduledRecurringMeetingsAttendedCount, source.AudioDuration, source.VideoDuration, source.ScreenShareDuration, source.AudioDurationInSeconds, source.VideoDurationInSeconds, source.ScreenShareDurationInSeconds, source.HasOtherAction, source.UrgentMessages, source.PostMessages, source.TenantDisplayName, source.SharedChannelTenantDisplayNames, source.ReplyMessages, source.IsLicensed, source.ReportPeriod, source.LoadDate);
