# kernel

ProcessManager {
    HighLevel {
        proc/process.% {
            PROCESS_FLAGS_TASK
            PROCESS_FLAGS_THREAD

            extern pid_t pcreate(pid_t parent, psects_t psections, uid_t uid, int flags);
            extern void pkill(pid_t pid);
            extern void pcleanup(pid_t pid);
            extern void penter(pid_t pid);
            .h
            extern void pleave();
            extern void psave();
            extern void pload(pid_t pid);
        }
    }
    LowLevel {
        arch/proc/task.h {
            :#include <arch/proc/tss.h>
        }
        arch/proc/tss.%
        arch/proc/tss_backed.asm
    }
}

MemoryManager {
    LowLevel {
        arch/mem/paging.% {
            PAGING_STAGE_0_ALIGN
            PAGING_STAGE_1_ALIGN
            PAGING_STAGE_2_ALIGN
            PAGING_STAGE_3_ALIGN
            PAGING_STAGE_0
            PAGING_STAGE_1
            PAGING_STAGE_2
            PAGING_STAGE_3
            PAGING_MAX_VPTR
            PAGING_MAX_PPTR
            PAGING_FLAGS_USER
            PAGING_FLAGS_EXECUTE
            PAGING_FLAGS_READ
            PAGING_FLAGS_WRITE
            PAGING_FLAGS_MMIO

            extern void alloc_page(void *vptr, void *pptr, ptable_t page_table, pstage_t page_stage, int flags);
            extern void dealloc_page(void *vpre, ptable_t page_table, pstage_t page_stage);
        }
    }
    HighLevel {
        mem/palloc.% {
            extern pharea_t *phreserve(void *pptr);
            extern void phdelete(pharea_t *phalloc_area);
            extern pharea_t *phalloc(size_t len);
        }
        mem/valloc.% {
            extern viarea_t *vireserve(void *vptr, pharea_t *area, ptable_t page_table, int flags);
            extern void videlete(viarea_t *valloc_area);
            extern viarea_t *vialloc(pharea_t *area, ptable_t page_table, viflags_t flags);
        }
        mem/pvalloc.% {
            extern void *pvalloc(size_t len, ptable_t page_table, pvflags_t flags);
            extern void pvfree(void *vptr);
        }
        mem/hmalloc.% {
            extern void *hmalloc(size_t size);
            extern void hfree(void *ptr);
            extern void *hrealloc(void *ptr, size_t size);
            extern void *hreallocarray(void *ptr, size_t n, size_t size);
        }
    }
}

UserManager {
    misc/users.% {
        extern void user_create(uid_t uid, gid_t gid, uperms_t permissions);
        extern void user_delete(uid_t uid);
        extern void user_reggroup(uid_t uid, gid_t gid);
        extern void user_unreggroup(uid_t uid, gid_t gid);
        extern void user_mod(uid_t uid, uperms_t permissions);
    }
    misc/groups.% {
        extern void group_create(gid_t gid, gperms_t permissions);
        extern void group_delete(gid_t gid);
        extern void group_mod(gid_t gid, gperms_t permissions);
    }
}

FileSystem {
    fs/inode.% {
        INODE_TYPE_DIRECTORY
        INODE_TYPE_FILE
        INODE_TYPE_DEVICE

        extern inode_t *inode_create(inode_t *parent, const char *name, uid_t owner, inode_perms_t permissions, inode_type_t type);
        extern void inode_delete(inode_t *parent, inode_t *inode);
        extern void inode_regcallback(inode_callback_t inode_callback, inode_t *inode);
        extern void inode_unregcallback(pid_t pid, inode_t *inode);
    }

    fs/rootfs.% {
        SEEK_START
        SEEK_CUR
        SEEK_END

        extern fdesc_t open(const char *filename, const char *modes);
        extern int tell(fdesc_t fd);
        extern int seek(fdesc_t fd, size_t offset, fwhence_t whence);
        extern int close(fdesc_t fd);
        extern int read(fdesc_t fd, void *buf, size_t n);
        extern int write(fdesc_t fd, void *buf, size_t n);
    }
}

